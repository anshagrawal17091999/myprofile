import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Destini()));
}

class Destini extends StatefulWidget {
  @override
  _DestiniState createState() => _DestiniState();
}

class _DestiniState extends State<Destini> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Image.asset('images/background.png'),
      )),
    );
  }
}
