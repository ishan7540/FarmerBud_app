import 'package:fitness_dashboard_ui/const/constant.dart';
import 'package:fitness_dashboard_ui/data/pie_chart_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Icon(
          Icons.person,
          size: 200,
        ),
      ),
    );
  }
}
