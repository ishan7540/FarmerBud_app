import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NPKValuesPage extends StatefulWidget {
  const NPKValuesPage({super.key});

  @override
  State<NPKValuesPage> createState() => _NPKValuesPageState();
}

class _NPKValuesPageState extends State<NPKValuesPage> {
  double optimalNitrogen = 0.0;
  double optimalPhosphorus = 0.0;
  double optimalPotassium = 0.0;

  Future<List<dynamic>> fetchPredictedValues() async {
    try {
      String index = '1';
      final response = await http.get(
          Uri.parse('https://flask-vercel-stjo.onrender.com/predict/$index'));
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw 'An unexpected error ';
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('NPK Values'),
      ),
      body: FutureBuilder(
          future: fetchPredictedValues(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            final data = snapshot.data!;
            final optimalNitrogen = data[0][0];
            final optimalPhosphorus = data[0][1];
            final optimalPotassium = data[0][2];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: const Text(
                      'Current NPK Values',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Current NPK Values Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildNPKCard('Nitrogen',
                          (optimalNitrogen - 34).toStringAsPrecision(3)),
                      buildNPKCard("Phosphorus",
                          (optimalPhosphorus - 1.4).toStringAsPrecision(3)),
                      buildNPKCard("Potassium",
                          (optimalPotassium - 2.1).toStringAsPrecision(3)),
                    ],
                  ),
                  const SizedBox(height: 50),
                  // Optimal NPK Values Row
                  Center(
                    child: const Text(
                      'Optimal NPK Values',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildNPKCard(
                          'Nitrogen', optimalNitrogen.toStringAsPrecision(3)),
                      buildNPKCard('Phosphorus',
                          optimalPhosphorus.toStringAsPrecision(3)),
                      buildNPKCard(
                          'Potassium', optimalPotassium.toStringAsPrecision(3)),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget buildNPKCard(String label, String value) {
    return SizedBox(
      height: 125,
      width: 117,
      child: Card(
        color: Color.fromARGB(255, 63, 113, 54),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 10),
              Text(
                '$value',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '$label',
                style: const TextStyle(fontSize: 13.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
