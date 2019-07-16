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
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String _resultText = "Insert Your Data";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetButton(){
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _resultText = "Insert Your Data";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculateBMI(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double bmi = weight / (height * height);
      print("Body Mass Index: $bmi");
      if(bmi < 10.6){
        _resultText = "Under Weight. (${bmi.toStringAsPrecision(4)})";
      }else if(bmi >= 18.6 && bmi < 24.9){
        _resultText = "Ideal Weight. (${bmi.toStringAsPrecision(4)})";
      }else if(bmi >= 24.9 && bmi < 29.9){
        _resultText = "Slightly OverWeight. (${bmi.toStringAsPrecision(4)})";
      }else if(bmi >= 29.9 && bmi < 34.9){
        _resultText = "Obesity LVL I. (${bmi.toStringAsPrecision(4)})";
      }else if(bmi >= 34.9 && bmi < 39.9){
        _resultText = "Obesity LVL II. (${bmi.toStringAsPrecision(4)})";
      }else if(bmi >= 40){
        _resultText = "Obesity LVL III. (${bmi.toStringAsPrecision(4)})";
      }
    });
  }

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
                _resetButton();
                debugPrint("Refresh Button Clicked.");
              })
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.person_pin, size: 120.0, color: Colors.blue),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Weight: (KG)",
                      labelStyle: TextStyle(color: Colors.blue)),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                  controller: weightController,
                  validator: (value){
                    if(value.isEmpty){
                      return "Insert Your Weight!";
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Height: (CM)",
                      labelStyle: TextStyle(color: Colors.blue)),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                  controller: heightController,
                  validator: (value){
                    if(value.isEmpty){
                      return "Insert Your Weight!";
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Container(
                    height: 50.0,
                    child: RaisedButton(
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                            _calculateBMI();
                          }
                        },
                        child: Text("Calculate BMI",
                            style: TextStyle(color: Colors.white, fontSize: 25.0)),
                        color: Colors.blue),
                  ),
                ),
                Text(
                  _resultText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue, fontSize: 20.0),
                ),
              ],
            )
        ),
      ),
    );
  }
}
