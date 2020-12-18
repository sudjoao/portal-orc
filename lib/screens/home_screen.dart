import 'package:flutter/material.dart';
import 'package:portal_orc/components/goal_card.dart';
import 'package:portal_orc/components/goal_card_info.dart';
import 'package:portal_orc/components/result_pie_chart.dart';
import 'package:portal_orc/styles/colors.dart';
import 'package:portal_orc/styles/styles.dart';
import '../utils/goal_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int actualGoal = 0;
  bool leftArrowVisible = false;
  bool rightArrowVisible = true;
  @override
  void initState() {
    super.initState();
  }

  void changeGoalScreen(int num) {
    if (actualGoal + num < 0 || actualGoal + num > 2) return;
    setState(() {
      actualGoal += num;
      print(actualGoal);
      actualGoal == 0 ? leftArrowVisible = false : leftArrowVisible = true;
      print(leftArrowVisible);
      actualGoal == 2 ? rightArrowVisible = false : rightArrowVisible = true;
      print(rightArrowVisible);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: leftArrowVisible,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                minWidth: 35,
                onPressed: () {
                  changeGoalScreen(-1);
                },
                child: Icon(
                  Icons.keyboard_arrow_left,
                  size: 35,
                  color: kGreenOrc2,
                ),
              ),
            ),
            Text(
              goalData[actualGoal]["title"],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: 'Inter',
                color: kGreenOrc1,
                fontWeight: FontWeight.w900,
              ),
            ),
            Visibility(
              visible: rightArrowVisible,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                minWidth: 35,
                onPressed: () {
                  changeGoalScreen(1);
                },
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 35,
                  color: kGreenOrc2,
                ),
              ),
            ),
          ],
        ),
        Image.network(
          'https://i.imgur.com/W025f9C.png',
          height: 120,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GoalCard(
              width: 180,
              height: 180,
              body: GoalCardInfo(
                goalLabel: goalData[actualGoal]["labels"][0],
                goalResult: goalData[actualGoal]["results"][0],
                totalGoal: goalData[actualGoal]["goals"][0],
                result: resulText(
                  goalData[actualGoal]["results"][0].toInt().toString() + "%",
                ),
              ),
            ),
            GoalCard(
              width: 180,
              height: 180,
              body: GoalCardInfo(
                goalLabel: goalData[actualGoal]["labels"][1],
                goalResult: goalData[actualGoal]["results"][1],
                totalGoal: goalData[actualGoal]["goals"][1],
                result: resulText(
                  goalData[actualGoal]["results"][1].toInt().toString(),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GoalCard(
            body: GoalCardInfo(
              goalLabel: goalData[actualGoal]["labels"][2],
              goalResult: goalData[actualGoal]["results"][2],
              totalGoal: goalData[actualGoal]["goals"][2],
              result: ResultPieChart(
                dataGraph: {
                  "current_billing": goalData[actualGoal]["results"][2],
                  "billing_goal": goalData[actualGoal]["results"][2] -
                              goalData[actualGoal]["goals"][2] >=
                          0
                      ? 0
                      : goalData[actualGoal]["goals"][2] -
                          goalData[actualGoal]["results"][2],
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
