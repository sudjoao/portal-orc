import 'package:flutter/material.dart';

class GoalCard extends StatelessWidget {
  final Widget body;
  final int flex;
  GoalCard({this.body, this.flex});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex != null ? flex : 1,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0x77FFFFFF),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: body,
        ),
      ),
    );
  }
}
