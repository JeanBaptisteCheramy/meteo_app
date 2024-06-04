import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class WeatherInfos {
  final Map<String, dynamic> coord;
  final List<Map<String, dynamic>> weather;
  final Map<String, dynamic> main;
  final Map<String, dynamic> wind;
  final Map<String, dynamic> clouds;
  final Map<String, dynamic> sys;
  final String name;

  const WeatherInfos({
    required this.coord,
    required this.weather,
    required this.main,
    required this.wind,
    required this.clouds,
    required this.sys,
    required this.name,
  });

  factory WeatherInfos.fromJson(Map<String, dynamic> json) {
    return WeatherInfos(
      coord: json['coord'],
      weather: List<Map<String, dynamic>>.from(json['weather']),
      main: json['main'],
      wind: json['wind'],
      clouds: json['clouds'],
      sys: json['sys'],
      name: json['name'],
    );
  }
}

Future<WeatherInfos> getWeather(double latitude, double longitude) async {
  String? apiKey = dotenv.env['API_KEY'];
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));

  if (response.statusCode == 200) {
    return WeatherInfos.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Échec du chargement des informations météorologiques');
  }
}
