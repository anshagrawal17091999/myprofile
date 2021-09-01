import 'package:flutter/material.dart';
import 'quiz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quiz qbank = Quiz();
void main() {
  runApp(MaterialApp(home: Quizapp()));
}

class Quizapp extends StatefulWidget {
  @override
  _QuizappState createState() => _QuizappState();
}

class _QuizappState extends State<Quizapp> {
  List<Icon> scorekeeper = [];
  void check(bool chosenanswer) {
    bool correctanswer = qbank.answer();
    setState(() {
      if (qbank.isfinished() == true) {
        Alert(
                context: context,
                title: "Quiz over",
                desc: "Your quiz is over. All the best.")
            .show();
        qbank.reset();
        scorekeeper.clear();
      } else {
        if (chosenanswer == correctanswer) {
          scorekeeper.add(Icon(Icons.check, color: Colors.green));
        } else {
          scorekeeper.add(Icon(Icons.close, color: Colors.red));
        }
        qbank.nextquestion();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      qbank.getquestiontext(),
                      style: TextStyle(color: Colors.white, fontSize: 34),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: TextButton(
                    onPressed: () {
                      check(true);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    child: Container(
                      child: Text('True',
                          style: TextStyle(color: Colors.white, fontSize: 34)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: TextButton(
                    onPressed: () {
                      check(false);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    child: Container(
                      child: Text('False',
                          style: TextStyle(color: Colors.white, fontSize: 34)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: scorekeeper,
              )
            ],
          ),
        ),);
  }
}
