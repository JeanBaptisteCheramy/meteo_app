import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Coordinates {
  final String name;
  final double longitude;
  final double latitude;

  const Coordinates({
    required this.name,
    required this.longitude,
    required this.latitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'longitude': double longitude,
        'latitude': double latitude,
      } =>
        Coordinates(
          name: name,
          longitude: longitude,
          latitude: latitude,
        ),
      _ => throw const FormatException('Failed to load coordinates.'),
    };
  }
}

Future<Coordinates> getCoordinates(
    String city, int stateCode, int countryCode) async {
  String? apiKey = dotenv.env['API_KEY'];

  final response = await http.get(Uri.parse(
      'http://api.openweathermap.org/geo/1.0/direct?q=$city,$stateCode,$countryCode&appid=$apiKey'));

  if (response.statusCode == 200) {
    dynamic data = jsonDecode(response.body);

    if (data is List && data.isNotEmpty) {
      // Si la réponse est une liste et qu'elle n'est pas vide, prenez le premier élément
      dynamic firstElement = data[0];

      // Extraire les coordonnées du premier élément
      String name = firstElement['name'];
      double longitude = firstElement['lon'];
      double latitude = firstElement['lat'];

      // Créer et retourner l'objet Coordinates
      return Coordinates(
        name: name,
        longitude: longitude,
        latitude: latitude,
      );
    } else {
      throw Exception('Réponse API invalide');
    }
  } else {
    throw Exception('Échec du chargement de la localisation');
  }
}
