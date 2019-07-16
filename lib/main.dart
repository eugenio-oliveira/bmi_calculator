import 'package:flutter/material.dart';

void main() {
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
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                debugPrint("Refresh Clicked.");
              })
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person_pin, size: 120.0, color: Colors.blue),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Weight: (KG)",
                labelStyle: TextStyle(color: Colors.blue)),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blue,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Height: (CM)",
                labelStyle: TextStyle(color: Colors.blue)),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blue,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
