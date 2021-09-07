import 'package:flutter/material.dart';
import 'package:myprofile/BMI App/constants.dart';

class Bottombutton extends StatelessWidget {
  Bottombutton(this.buttontitle, this.ontap);
  final Function()? ontap;
  final String buttontitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
            child: Text(
          buttontitle,
          style: bottonstyle,
        )),
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: bottomcardcolour,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 80,
      ),
    );
  }
}
