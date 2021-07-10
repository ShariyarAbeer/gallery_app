import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class GridScreen extends StatefulWidget {
  const GridScreen({Key key}) : super(key: key);

  @override
  _GridScreenState createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  var data;
  List datalist = [];

  Future getdata() async {
    var response =
        await http.get("https://jsonplaceholder.typicode.com/photos");
    setState(() {
      var decode = json.decode(response.body);
      data = decode;
      datalist = data;
      print(datalist);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
        itemBuilder: (context, index) {
          return Image.network(data[index]["thumbnailUrl"]);
        },
      ),
    );
  }
}
