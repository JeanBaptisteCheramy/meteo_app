import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ForecastDayByDay {
  final List<dynamic> upcomingDays;

  const ForecastDayByDay({
    required this.upcomingDays,
  });

  factory ForecastDayByDay.fromJson(Map<String, dynamic> json) {
    return ForecastDayByDay(
      upcomingDays: List<dynamic>.from(json['forecast']),
    );
  }
}

Future<ForecastDayByDay> getDayByDayForecast(
    double latitude, double longitude) async {
  String? apiKey = dotenv.env['DBD_API_KEY'];

  final response = await http.get(
      Uri.parse(
          'https://api.meteo-concept.com/api/forecast/daily?token=$apiKey&latlng=$latitude,$longitude'),
      headers: {"Content-Type": "application/json"});

  if (response.statusCode == 200) {
    return ForecastDayByDay.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Échec du chargement des informations météorologiques');
  }
}
