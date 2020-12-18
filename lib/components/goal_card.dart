import 'package:flutter/material.dart';

class GoalCard extends StatelessWidget {
  final Widget body;
  final int flex;
  final double width;
  final double height;
  GoalCard({this.body, this.flex, this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Color(0x77FFFFFF),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: body,
      ),
    );
  }
}
