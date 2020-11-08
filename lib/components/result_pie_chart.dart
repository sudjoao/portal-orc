import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:portal_orc/styles/colors.dart';

class ResultPieChart extends StatelessWidget {
  final Map<String, double> dataGraph;
  ResultPieChart({this.dataGraph});
  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataGraph,
      colorList: [kGreenOrc1, kAshOrc1],
      chartRadius: MediaQuery.of(context).size.width / 3.0,
      legendOptions: LegendOptions(
        showLegends: false,
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValues: true,
        showChartValueBackground: true,
        chartValueStyle: TextStyle(
          color: Colors.white,
        ),
        chartValueBackgroundColor: Colors.black12,
      ),
    );
  }
}
