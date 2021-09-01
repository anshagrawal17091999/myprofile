import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(Zylophone());
}

class Zylophone extends StatefulWidget {
  @override
  _ZylophoneState createState() => _ZylophoneState();
}

class _ZylophoneState extends State<Zylophone> {
  void number(int xylophone){
    final player = AudioCache();
    player.play('note$xylophone.wav');
  }
  Expanded buildkey({required Color color, required int playnum}){
    return Expanded(
      child: TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color)),
      onPressed: () {
        number(playnum);
      },
      child: Container(),
      ),
    );
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: <Widget>[
            buildkey(color: Colors.red, playnum: 1),
            buildkey(color: Colors.orangeAccent, playnum: 2),
            buildkey(color: Colors.purple, playnum: 3),
            buildkey(color: Colors.blue, playnum: 4),
            buildkey(color: Colors.green, playnum: 5),
            buildkey(color: Colors.yellow, playnum: 6),
            buildkey(color: Colors.cyan, playnum: 7),
            ],
          ),
        ),
      ),
    );
  }
}
