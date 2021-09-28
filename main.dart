import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  TextEditingController _heightcontoller = TextEditingController();
  TextEditingController _weightcontoller = TextEditingController();
  double _bmi_cal = 0;
  String _texres = "";
  Color _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          toolbarHeight: 70,
          title: Center(
              child: Text(
            "BMI calculater",
            style: TextStyle(fontSize: 22, color: Colors.blue),
          )),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 90,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 22),
                        controller: _heightcontoller,
                        decoration: InputDecoration(
                          hintText: "Height in cm",
                          hintStyle: TextStyle(fontSize: 15),
                        ),
                      )),
                  SizedBox(width: 22),
                  Container(
                      width: 90,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 22),
                        controller: _weightcontoller,
                        decoration: InputDecoration(
                            hintText: "Weight in kg",
                            hintStyle: TextStyle(fontSize: 15)),
                      ))
                ],
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  double _h = double.parse(_heightcontoller.text);
                  double _w = double.parse(_weightcontoller.text);

                  setState(() {
                    _bmi_cal = _w / pow((_h / 100), 2);
                    if (_bmi_cal <= 18.4) {
                      _texres = "You are underweight.";
                      _color = Colors.yellow;
                    } else if (_bmi_cal <= 24.9) {
                      _texres = "You are healthy.";
                      _color = Colors.green;
                    } else if (_bmi_cal <= 29.9) {
                      _texres = "You are over weight.";
                      _color = Colors.orange;
                    } else if (_bmi_cal <= 34.9) {
                      _texres = "You are severely over weight.";
                    } else if (_bmi_cal <= 39.9) {
                      _texres = "You are obese.";
                      _color = Colors.redAccent;
                    } else {
                      _texres = "You are severely obese.";
                      _color = Colors.red;
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Your BMI is leavel\t",
                        style: TextStyle(fontSize: 18)),
                    Text(_bmi_cal.toStringAsFixed(2),
                        style: TextStyle(fontSize: 20, color: _color)),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Visibility(
                visible: _texres.isNotEmpty,
                child: Container(
                  child: Text(
                    _texres,
                    style: TextStyle(color: _color, fontSize: 24),
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " Developed by Flutter ",
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(width: 0),
                  Text(
                    " @2021 ",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
