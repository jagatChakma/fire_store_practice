import 'package:fire_store_practice/fire_animated_list/testpage.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  var list;
  DetailScreen({Key? key, required this.list}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.list['placeName']),
      ),
      body: Column(
        children: [
          Container(
            height: 300.0,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(widget.list['placePicture']),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TestPage(testList: widget.list),
                ),
              );
            },
            child: Text(
              widget.list['placeDis'],
            ),
          ),
        ],
      ),
    );
  }
}
