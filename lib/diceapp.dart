import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(Dice());
}

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftdice = 4;
  int rightdice = 4;
  void dicefunction ()
  {
    setState(() {
      rightdice = Random().nextInt(6) + 1;
    leftdice = Random().nextInt(6) + 1;
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Dice App',
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
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                            dicefunction();
                      },
                      child: Image(
                        image: AssetImage('images/dice$leftdice.png'),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                            dicefunction();
                      },
                      child: Image.asset('images/dice$rightdice.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

