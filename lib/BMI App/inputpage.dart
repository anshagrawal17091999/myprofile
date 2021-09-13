import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myprofile/BMI App/resultspage.dart';
import 'reuseablecard.dart';
import 'cardchildwidget.dart';
import 'constants.dart';
import 'calculatebmi.dart';
import 'package:myprofile/BMI App/bottombutton.dart';
import 'roundiconbutton.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  // Color malecardcolor = inactivecardcolour;
  // Color femalecardcolor = inactivecardcolour;

  // void cardcolour(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (malecardcolor == inactivecardcolour) {
  //       malecardcolor = activecardcolour;
  //       femalecardcolor = inactivecardcolour;
  //     } else {
  //       malecardcolor = inactivecardcolour;
  //     }
  //   } else if (gender == Gender.female) {
  //     if (femalecardcolor == inactivecardcolour) {
  //       femalecardcolor = activecardcolour;
  //       malecardcolor = inactivecardcolour;
  //     } else {
  //       femalecardcolor = inactivecardcolour;
  //     }
  //   }
  // }
  Gender? selectedgender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Reusuablecard(
                      onPress: () {
                        setState(() {
                          // malecardcolor == inactivecardcolour ? malecardcolor = activecardcolour : malecardcolor = inactivecardcolour;
                          // cardcolour(Gender.male);
                          selectedgender = Gender.male;
                        });
                      },
                      colour: selectedgender == Gender.male
                          ? activecardcolour
                          : inactivecardcolour,
                      cardchild: Cardchildwidget(
                          iconame: FontAwesomeIcons.mars, displaytext: 'Male'),
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: Reusuablecard(
                      onPress: () {
                        setState(() {
                          // femalecardcolor == inactivecardcolour ? femalecardcolor = activecardcolour : femalecardcolor = inactivecardcolour;
                          // cardcolour(Gender.female);
                          selectedgender = Gender.female;
                        });
                      },
                      colour: selectedgender == Gender.female
                          ? activecardcolour
                          : inactivecardcolour,
                      cardchild: Cardchildwidget(
                          iconame: FontAwesomeIcons.venus,
                          displaytext: 'Female'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Reusuablecard(
                colour: inactivecardcolour,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Height', style: labeltextstyle),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: boldtextstyle),
                        SizedBox(width: 5),
                        Text('cm', style: labeltextstyle),
                      ],
                    ),
                    Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Colors.pink,
                        inactiveColor: Colors.grey,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        })
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Reusuablecard(
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: labeltextstyle,
                          ),
                          SizedBox(height: 10),
                          Text(
                            weight.toString(),
                            style: boldtextstyle,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Roundiconbutton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  weight = weight + 1;
                                });
                              }),
                              SizedBox(width: 10),
                              Roundiconbutton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  weight = weight - 1;
                                });
                              })
                            ],
                          )
                        ],
                      ),
                      colour: inactivecardcolour,
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: Reusuablecard(
                        cardchild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Age',
                              style: labeltextstyle,
                            ),
                            SizedBox(height: 10),
                            Text(
                              age.toString(),
                              style: boldtextstyle,
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Roundiconbutton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    age = age + 1;
                                  });
                                }),
                                SizedBox(width: 10),
                                Roundiconbutton(FontAwesomeIcons.minus, () {
                                  setState(() {
                                    age = age - 1;
                                  });
                                })
                              ],
                            )
                          ],
                        ),
                        colour: inactivecardcolour),
                  ),
                ],
              ),
            ),
            Bottombutton(
              'Calculate Now',
              () {
                Calculatorbrain calc =
                    Calculatorbrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Resultspage(calc.bmicalculate(),
                            calc.bmiresult(), calc.interpretation())));
              },
            ),
          ],
        ),
      ),
    );
  }
}
