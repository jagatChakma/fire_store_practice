import 'package:fire_store_practice/fire_animated_list/detail_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class FireAnimatedList extends StatefulWidget {
  const FireAnimatedList({Key? key}) : super(key: key);

  @override
  State<FireAnimatedList> createState() => _FireAnimatedListState();
}

class _FireAnimatedListState extends State<FireAnimatedList> {
  final _ref = FirebaseDatabase.instance.ref().child("rangamati");
  // late Map? myDataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Animated List"),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map mydata = snapshot.value as Map;
            mydata['key'] = snapshot.key;
            // myDataList = mydata;
            // print(snapshot.value);
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(list: mydata),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    FadeInImage.assetNetwork(
                      placeholder: 'images/back.png',
                      image: mydata['placePicture'],
                    ),
                    Text(
                      mydata['placeName'],
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Text(mydata['placeDis']),
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
