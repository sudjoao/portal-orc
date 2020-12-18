import 'package:flutter/material.dart';
import 'package:portal_orc/styles/styles.dart';

class GoalCardInfo extends StatelessWidget {
  final String goalLabel;
  final double goalResult;
  final double totalGoal;
  final Widget result;
  GoalCardInfo({this.goalLabel, this.goalResult, this.totalGoal, this.result});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          goalLabel,
          textAlign: TextAlign.center,
          style: kGoalLabelStyle,
        ),
        result,
        Text(
          goalResult.toInt().toString() + "/" + totalGoal.toInt().toString(),
          textAlign: TextAlign.end,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
