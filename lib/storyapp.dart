import 'package:flutter/material.dart';
import 'storybrain.dart';
void main() {
  runApp(MaterialApp(home: Destini()));
}

Storybrain storybrainobject = Storybrain();

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
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('images/background.png'),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 50, 20, 100),
                  child: Center(
                    child: Text(
                      storybrainobject.getstory(),
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      storybrainobject.nextstory(1);
                    });
                  },
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    padding: EdgeInsets.all(20),
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        storybrainobject.getchoice1(),
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Visibility(
                  visible: storybrainobject.buttonvisible(),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        storybrainobject.nextstory(2);
                      });
                    },
                    child: Container(
                      constraints: BoxConstraints.expand(),
                      padding: EdgeInsets.all(20),
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          storybrainobject.getchoice2(),
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
