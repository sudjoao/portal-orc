import 'package:flutter/material.dart';
import 'package:portal_orc/styles/colors.dart';

Color getColorResult(double actualValue, double goalValue) {
  if (actualValue >= goalValue) return kGreenOrc1;
  if (actualValue >= goalValue / 2) return kYellowOrc1;
  return Colors.red;
}
