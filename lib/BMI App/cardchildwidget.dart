import 'package:flutter/material.dart';
import 'constants.dart';

class Cardchildwidget extends StatelessWidget {
  Cardchildwidget({this.iconame, this.displaytext});

  final IconData? iconame;
  final String? displaytext;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconame, size: 50),
        SizedBox(height: 10),
        Text(
          '$displaytext',
          style: labeltextstyle,
        )
      ],
    );
  }
}