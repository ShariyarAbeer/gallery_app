import 'package:flutter/material.dart';
import 'gridView.dart';
import 'listView.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery App"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: Text("List View"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListScreen(),
                ),
              ),
            ),
            TextButton(
              child: Text("Grid View"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GridScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
