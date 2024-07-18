import 'package:fitness_dashboard_ui/widgets/activity_details_card.dart';
import 'package:fitness_dashboard_ui/widgets/header_widget.dart';
import 'package:fitness_dashboard_ui/widgets/line_chart_card.dart';
import 'package:fitness_dashboard_ui/widgets/weather_widget.dart'; // Add this import
import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
        child: Column(
          children: [
            const HeaderWidget(),

            const WeatherWidget(), // Add the WeatherWidget here
            const SizedBox(height: 14),
            SizedBox(
              height: 24,
              width: 352,
              child: Text(
                textAlign: TextAlign.left,
                'Your Fields :-',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            SizedBox(height: 0),
            ActivityDetailsCard(),
            const SizedBox(height: 10),
            SizedBox(
              height: 24,
              width: 352,
              child: Text(
                textAlign: TextAlign.left,
                'Additional Info:-',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            const LineChartCard(),
            const SizedBox(height: 18),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
