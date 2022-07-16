import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/constants.dart';

class IconContent extends StatelessWidget {

  IconContent({this.icon, this.label});

  final IconData ? icon;
  final String ? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
            label ?? ' ',
            style: kLabelTextStyle,
        )
      ],
    );
  }
}