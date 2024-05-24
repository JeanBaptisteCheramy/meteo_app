import 'package:flutter/material.dart';
import 'package:meteo_app/models/coordinates_model.dart';

class LocationModel extends ChangeNotifier {
  Map<String, dynamic> location = {
    'city': '',
    'stateCode': null,
    'countryCode': null
  };
  LocationModel({required this.location});

  Future<void> setLocation(String city, int stateCode, int countryCode) async {
    Coordinates coordinates =
        await getCoordinates(city, stateCode, countryCode);

    location['city'] = coordinates.name;
    location['stateCode'] = coordinates.longitude;
    location['countryCode'] = coordinates.latitude;

    notifyListeners();
  }
}
