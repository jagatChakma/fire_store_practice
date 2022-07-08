import 'package:fire_store_practice/fire_list/cht_ture_data_show.dart';
import 'package:flutter/material.dart';

class TestDetailList extends StatefulWidget {
  ModelOfRangamati itemDetailList;
  TestDetailList({Key? key, required this.itemDetailList}) : super(key: key);

  @override
  State<TestDetailList> createState() => _TestDetailListState();
}

class _TestDetailListState extends State<TestDetailList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.itemDetailList.pName),
      ),
      body: Container(
        child: Image(
          height: 500.0,
          fit: BoxFit.cover,
          image: NetworkImage(widget.itemDetailList.imageUrl),
        ),
      ),
    );
  }
}
