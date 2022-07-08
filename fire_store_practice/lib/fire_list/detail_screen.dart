import 'package:fire_store_practice/fire_list/testdetaillist.dart';
import 'package:flutter/material.dart';
import 'cht_ture_data_show.dart';

class ChtDetailScreen extends StatefulWidget {
  ModelOfRangamati detailList;
  ChtDetailScreen({Key? key, required this.detailList}) : super(key: key);

  @override
  State<ChtDetailScreen> createState() => _ChtDetailScreenState();
}

class _ChtDetailScreenState extends State<ChtDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        //title
        title: Text(widget.detailList.pName),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      TestDetailList(itemDetailList: widget.detailList),
                ),
              );
            },
            child: Container(
              child: Image(
                image: NetworkImage(widget.detailList.imageUrl),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
