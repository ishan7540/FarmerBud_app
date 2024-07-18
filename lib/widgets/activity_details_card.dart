import 'package:flutter/material.dart';
import 'custom_card_widget.dart';

class ActivityDetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: CustomCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Manjal Khurd ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Field 1'),
                Text('Crop = Rice/Wheat'),
                Text('Node Status = Active'),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: CustomCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Manjal Khurd ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Field 2'),
                Text('Crop = Rice/Wheat'),
                Text('Node Status = Active'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
