import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:portal_orc/components/goal_card.dart';
import 'package:portal_orc/components/goal_card_info.dart';
import 'package:portal_orc/components/result_pie_chart.dart';
import 'package:portal_orc/styles/colors.dart';
import 'package:portal_orc/styles/styles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double projectMember = 75;
  double projectNumber = 1;
  double faturamento = 0;
  Map<String, double> dataGraph = {
    "current_billing": 40000.0,
    "billing_goal": 0.0,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenOrc3,
      appBar: AppBar(
        backgroundColor: kGreenOrc1,
        shadowColor: Color(0x00),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                Text(
                  'ALTO CRESCIMENTO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Inter',
                    color: kGreenOrc1,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],
            ),
            Image.network(
              'https://i.imgur.com/W025f9C.png',
              height: 80,
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GoalCard(
                      body: GoalCardInfo(
                        goalLabel: "Membros em Projetos",
                        goalResult: projectMember,
                        totalGoal: 75,
                        result: resulText(
                            projectMember.toInt().toString() + "%",
                            projectMember,
                            75.0),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GoalCard(
                      body: GoalCardInfo(
                        goalLabel: "Projetos",
                        goalResult: projectNumber,
                        totalGoal: 4,
                        result: resulText(
                          projectNumber.toInt().toString(),
                          projectNumber,
                          4.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GoalCard(
                  body: GoalCardInfo(
                    goalLabel: "Faturamento",
                    goalResult: 40000,
                    totalGoal: 36000,
                    result: ResultPieChart(
                      dataGraph: dataGraph,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
