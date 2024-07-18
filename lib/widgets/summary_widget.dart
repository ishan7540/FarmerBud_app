import 'package:fitness_dashboard_ui/const/constant.dart';
import 'package:fitness_dashboard_ui/widgets/pie_chart_widget.dart';
import 'package:fitness_dashboard_ui/widgets/scheduled_widget.dart';
import 'package:fitness_dashboard_ui/widgets/summary_details.dart';
import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                Chart(),
                SizedBox(height: 40),
                Scheduled(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
