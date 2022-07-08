import 'package:fire_store_practice/fire_animated_list/detail_screen.dart';
import 'package:fire_store_practice/fire_list/detail_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ChtData extends StatefulWidget {
  const ChtData({Key? key}) : super(key: key);

  @override
  State<ChtData> createState() => _ChtDataState();
}

class _ChtDataState extends State<ChtData> {
  List<ModelOfRangamati> rangamatiList = [];

  void getData() async {
    await FirebaseDatabase.instance.ref('rangamati').get().then((data) {
      Map<dynamic, dynamic> map = data.value as Map<dynamic, dynamic>;

      map.forEach((key, value) {
        // print("Values : ${value["placePicture"]}");
        rangamatiList.add(
          ModelOfRangamati(
            value['placePicture'],
            value['placeName'],
            value['placeDis'],
          ),
        );
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView.builder(
          itemCount: rangamatiList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ChtDetailScreen(detailList: rangamatiList[index]),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200.0,
                      width: 200.0,
                      // decoration: BoxDecoration(
                      //   color: Colors.grey[300],
                      // ),
                      child: rangamatiList == null
                          //condition not working
                          ? Center(
                              child: Text("Loding..."),
                            )
                          : Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                rangamatiList[index].imageUrl.toString(),
                              ),
                            ),
                    ),
                    Text(
                      rangamatiList[index].pName,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(rangamatiList[index].pDiscription),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ModelOfRangamati {
  String imageUrl;
  String pName;
  String pDiscription;

  ModelOfRangamati(this.imageUrl, this.pName, this.pDiscription);
}
