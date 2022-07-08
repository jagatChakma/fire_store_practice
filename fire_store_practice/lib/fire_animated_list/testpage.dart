import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  var testList;
  TestPage({Key? key, required this.testList}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.testList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.testList['placeName']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              widget.testList['placeName'],
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            Image(
              fit: BoxFit.cover,
              image: NetworkImage(widget.testList['placePicture']),
            ),
            Image(
              fit: BoxFit.cover,
              image: NetworkImage(widget.testList['placePicture']),
            ),
            Image(
              fit: BoxFit.cover,
              image: NetworkImage(widget.testList['placePicture']),
            ),
          ],
        ),
      ),
    );
  }
}
