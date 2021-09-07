import 'package:flutter/material.dart';
import 'package:myprofile/BMI App/constants.dart';
import 'package:myprofile/BMI App/inputpage.dart';
import 'package:myprofile/BMI App/reuseablecard.dart';
import 'package:myprofile/BMI App/bottombutton.dart';

class Resultspage extends StatelessWidget {
  
  Resultspage(this.bmiresult, this.resulttext, this.interpretation);
  final String? bmiresult;
  final String? resulttext;
  final String? interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    'Your results',
                    style: titlestyle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Reusuablecard(
                colour: activecardcolour,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resulttext!,
                      style: boldtextstyle,
                    ),
                    Text(
                      bmiresult!,
                      style: BMIstyle,
                    ),
                    Text(
                      interpretation!,
                      style: labeltextstyle,
                    ),
                  ],
                ),
              ),
            ),
            Bottombutton(
              'Calculate again',
              () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
