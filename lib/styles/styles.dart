import 'package:flutter/material.dart';
import 'package:portal_orc/styles/colors.dart';
import 'package:portal_orc/utils/results_utils.dart';

TextStyle kGoalLabelStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

TextStyle kResultStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
);

Widget resulText(text, actualValue, goalValue) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: kResultStyle.copyWith(
      color: getColorResult(actualValue, goalValue),
    ),
  );
}
