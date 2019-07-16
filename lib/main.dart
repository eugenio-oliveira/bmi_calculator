import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator v1.0"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: (){ debugPrint("Refresh Clicked."); })
        ],
      ),
    );
  }
}
