import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
              height: double.infinity,
              width: 100,
              color: Colors.green,
              child: Text('Ansh is a legend'),
            ),
            Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.blue,
                child: Text('Ansh is loser'),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
                child: Text('Ansh is nice'),
              )],
            ),
            Container(
              height: double.infinity,
              width: 100,
              color: Colors.green,
              child: Text('Ansh is nice'),
            )
          ]),
        ),
      ),
    );
  }
}