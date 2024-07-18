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
