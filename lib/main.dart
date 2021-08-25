import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(Alexa());
}

class Alexa extends StatefulWidget {
  @override
  _AlexaState createState() => _AlexaState();
}

class _AlexaState extends State<Alexa> {
  int number = 3;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Ask me anything',
              style: TextStyle(
                  fontFamily: 'SourceSansPro', fontStyle: FontStyle.normal),
            ),
          ),
          backgroundColor: Colors.red,
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextButton(
                onPressed: (){
                  setState(() {
                    number = Random().nextInt(5)+1;
                  });
                },
                child: Container(
                  child: Image.asset('ball$number.png'),
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}

