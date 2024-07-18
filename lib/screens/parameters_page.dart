import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ParametersPage extends StatefulWidget {
  @override
  State<ParametersPage> createState() => _ParametersPageState();
}

class _ParametersPageState extends State<ParametersPage> {
  final List<String> dataFields = [
    'T2M',
    'RH2M',
    'PS',
    'ARI',
    'CAI',
    'CIRE',
    'DWSI',
    'EVI',
    'GCVI',
    'MCARI',
    'SIPI',
    'pH x (0.1)',
    'Temperature (°C)',
    'EC (µS/cm)'
  ];

  List<String> dataValues =
      List.filled(14, ''); // Initialize with empty strings

  Future<void> fetchParameters() async {
    for (int i = 1; i <= 14; i++) {
      String index1 = '1';

      final response = await http.get(
          Uri.parse('https://elc-api-index.onrender.com/parameters/$index1'));

      if (response.statusCode == 200) {
        List<dynamic> responseData = jsonDecode(response.body);

        setState(() {
          // Assuming responseData is a list of 14 elements
          if (responseData.length == 14) {
            dataValues[i - 1] = responseData[i - 1]
                .toString(); // Assign each element to corresponding index
          }
        });
      } else {
        throw Exception('Failed to load parameters');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchParameters(); // Call the fetchParameters function when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soil Parameters'),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            childAspectRatio:
                1.9 / 1, // Adjust this to control the height of the cards
            mainAxisSpacing: 7, // Add spacing between rows
            crossAxisSpacing: 8.0, // Add spacing between columns
          ),
          itemCount: 14,
          itemBuilder: (context, index) {
            return Card(
              color: Color.fromARGB(255, 63, 113, 54),
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      dataFields[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      dataValues[index], // Display fetched value here
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
