import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Chart/chart.dart';
import 'package:flutter_mp3/components/Chart/chart_list.dart';
import 'package:flutter_mp3/components/Layout/layout.dart';

class KrChartPage extends StatelessWidget {
  const KrChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: const [
                Chart(),
                SizedBox(
                  height: 30,
                ),
                ChartList()
              ],
            )));
  }
}
