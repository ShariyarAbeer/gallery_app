import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class ListScreen extends StatefulWidget {
  const ListScreen({Key key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  var data;
  List datalist = [];

  Future getdata() async {
    var response =
        await http.get("https://jsonplaceholder.typicode.com/albums");
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
        title: Text("This is List data"),
      ),
      // body: Text("Data"),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]["id"].toString()),
            subtitle: Text(data[index]["title"]),
          );
        },
      ),
    );
  }
}
