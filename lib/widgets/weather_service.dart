import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = 'e2145fe464ca609566f440966b5caa4c';
  final String city = 'Patiala';
  final String country = 'IN';

  Future<Map<String, dynamic>> fetchWeather() async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city,$country&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
