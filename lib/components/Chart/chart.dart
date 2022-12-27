import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      isShowingMainData ? sampleData1 : sampleData2,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  List<FlSpot> randomizeData() {
    var list = List<FlSpot>.generate(10, (index) {
      return FlSpot(index + 12, (Random().nextDouble() * 2) + 0.8);
    });
    return list;
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 12,
        maxX: 21,
        minY: 0,
        maxY: 5,
      );

  LineChartData get sampleData2 => LineChartData(
        lineTouchData: lineTouchData2,
        gridData: gridData,
        titlesData: titlesData2,
        borderData: borderData,
        lineBarsData: lineBarsData2,
        minX: 12,
        maxX: 21,
        minY: 0,
        maxY: 5,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        // handleBuiltInTouches: true,
        handleBuiltInTouches: false,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        // bottomTitles: AxisTitles(
        //   sideTitles: bottomTitles,
        // ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
        lineChartBarData1_3,
      ];

  LineTouchData get lineTouchData2 => LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        // bottomTitles: AxisTitles(
        //   sideTitles: bottomTitles,
        // ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  List<LineChartBarData> get lineBarsData2 => [
        lineChartBarData2_1,
        lineChartBarData2_2,
        lineChartBarData2_3,
      ];

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff72719b),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('SEPT', style: style);
        break;
      case 7:
        text = const Text('OCT', style: style);
        break;
      case 12:
        text = const Text('DEC', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Color(0xff4e4965), width: 1),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
      isCurved: true,
      color: const Color(0xfff0a50e),
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: randomizeData());

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
      isCurved: true,
      color: const Color(0xffaa4cfc),
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: false,
        color: const Color(0x00aa4cfc),
      ),
      spots: randomizeData());

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
      isCurved: true,
      color: const Color(0xff27b6fc),
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: randomizeData());

  LineChartBarData get lineChartBarData2_1 => LineChartBarData(
      isCurved: true,
      curveSmoothness: 0,
      color: const Color(0xfff0a50e),
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
      spots: randomizeData());

  LineChartBarData get lineChartBarData2_2 => LineChartBarData(
      isCurved: true,
      color: const Color(0x99aa4cfc),
      curveSmoothness: 0,
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
      spots: randomizeData());

  LineChartBarData get lineChartBarData2_3 => LineChartBarData(
      isCurved: true,
      curveSmoothness: 0,
      color: const Color(0xff27b6fc),
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
      spots: randomizeData());
}

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<StatefulWidget> createState() => ChartState();
}

class ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(199, 103, 241, 112),
              Color.fromARGB(150, 57, 186, 65),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const <Widget>[
                  SizedBox(
                    height: 37,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 16, left: 6),
                      child: _LineChart(isShowingMainData: false),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("#KrChart",
                          style: Theme.of(context).textTheme.titleLarge),
                      Text("27.12.2022-23:00",
                          style: Theme.of(context).textTheme.displaySmall),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
