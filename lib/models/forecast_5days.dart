import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Forecast5Days {
  final List<Map<String, dynamic>> forecast;

  const Forecast5Days({
    required this.forecast,
  });

  factory Forecast5Days.fromJson(Map<String, dynamic> json) {
    return Forecast5Days(
      forecast: List<Map<String, dynamic>>.from(json['list']),
    );
  }
}

Future<Forecast5Days> getForecast(double latitude, double longitude) async {
  String? apiKey = dotenv.env['API_KEY'];
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey'));

  if (response.statusCode == 200) {
    return Forecast5Days.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Échec du chargement des informations météorologiques');
  }
}
