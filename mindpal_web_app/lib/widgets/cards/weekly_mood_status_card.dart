import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyMoodStatusCard extends StatelessWidget {
  const WeeklyMoodStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: BarChart(
          BarChartData(
              // read about it in the BarChartData section
              barGroups: [BarChartGroupData(x: 7, barsSpace: 2)]),
          swapAnimationDuration: const Duration(milliseconds: 150), // Optional
          swapAnimationCurve: Curves.linear, // Optional
        ),
      ),
    );
  }
}
