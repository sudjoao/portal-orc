import 'package:flutter/material.dart';
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
  List<Map<String, dynamic>> goalData;
  int actualGoal = 0;
  Map<String, double> dataGraph;

  @override
  void initState() {
    setState(() {
      goalData = [
        {
          "title": "Alto Crescimento",
          "labels": ["Membros em Projetos", "Projetos", "Faturamento"],
          "goals": [75.0, 6.0, 31000.0],
          "results": [83.0, 10.0, 48000.0]
        },
        {
          "title": "Conectada",
          "labels": [
            "Participação em Eventos",
            "Ações Compartilhadas",
            "Alto Crescimento"
          ],
          "goals": [71.0, 4.0, 100.0],
          "results": [89.0, 4.0, 100.0]
        },
        {
          "title": "Impacto",
          "labels": ["NPS", "Projetos de Impacto", "EJ Conectada"],
          "goals": [50.0, 3.0, 100.0],
          "results": [100.0, 8.0, 90.0]
        }
      ];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenOrc3,
      appBar: AppBar(
        backgroundColor: kGreenOrc1,
        shadowColor: Color(0x00),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                padding: EdgeInsets.all(0),
                minWidth: 35,
                onPressed: () {
                  setState(() {
                    actualGoal--;
                  });
                },
                child: Icon(
                  Icons.keyboard_arrow_left,
                  size: 35,
                  color: kGreenOrc2,
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
              FlatButton(
                padding: EdgeInsets.all(0),
                minWidth: 35,
                onPressed: () {
                  setState(() {
                    actualGoal++;
                  });
                },
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 35,
                  color: kGreenOrc2,
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
      ),
    );
  }
}
