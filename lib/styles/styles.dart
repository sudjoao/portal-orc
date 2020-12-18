import 'package:flutter/material.dart';

TextStyle kGoalLabelStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

TextStyle kResultStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
);

Widget resulText(text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: kResultStyle.copyWith(
      color: Colors.black,
    ),
  );
}
