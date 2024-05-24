import 'package:flutter/material.dart';
import 'package:meteo_app/models/coordinates_model.dart';

class LocationModel extends ChangeNotifier {
  Map<String, dynamic> location = {
    'city': '',
    'longitude': null,
    'latitude': null
  };
  LocationModel({required this.location});

  Future<void> setLocation(String city, int stateCode, int countryCode) async {
    Coordinates coordinates =
        await getCoordinates(city, stateCode, countryCode);

    location['city'] = coordinates.name;
    location['longitude'] = coordinates.longitude;
    location['latitude'] = coordinates.latitude;

    notifyListeners();
  }
}
