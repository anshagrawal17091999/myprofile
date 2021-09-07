import 'package:flutter/material.dart';

class Roundiconbutton extends StatelessWidget {
  Roundiconbutton(this.icon, this.press);
  final IconData? icon;
  final Function()? press;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: press,
      child: Icon(icon),
      elevation: 6,
      constraints: BoxConstraints.tightFor(height: 40.0, width: 40.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}