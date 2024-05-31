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
    // dynamic data = jsonDecode(response.body);

    // Map<String, dynamic> iterateMap(Map<String, dynamic> object) {
    //   Map<String, dynamic> result = {};
    //   object.forEach((key, value) {
    //     result[key] = value;
    //   });
    //   return result;
    // }

    // Map<String, dynamic> coord = {'coord': iterateMap(data['coord'])};
    // Map<String, dynamic> main = {'main': iterateMap(data['main'])};
    // // List<Map<String, dynamic>> weather = iterateMap(data['weather']);
    // Map<String, dynamic> wind = {'wind': iterateMap(data['wind'])};
    // Map<String, dynamic> clouds = {'clouds': iterateMap(data['clouds'])};
    // Map<String, dynamic> sys = {'sys': iterateMap(data['sys'])};

    return WeatherInfos.fromJson(jsonDecode(response.body));

    // return WeatherInfos(
    //   coord: coord,
    //   // weather: weather,
    //   main: main,
    //   wind: wind,
    //   clouds: clouds,
    //   sys: sys,
    // );
  } else {
    throw Exception('Échec du chargement des informations météorologiques');
  }
}
