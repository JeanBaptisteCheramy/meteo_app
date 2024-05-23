import 'package:flutter/material.dart';
import 'package:meteo_app/services/services.dart';

class LocationModel extends ChangeNotifier {
  Map<String, dynamic> location = {
    'city': '',
    'stateCode': null,
    'countryCode': null
  };
  LocationModel({required this.location});

  void setLocation(String city, int stateCode, int countryCode) {
    getCoordinates(city, stateCode, countryCode);
    location['city'] = city;
    location['stateCode'] = stateCode;
    location['countryCode'] = countryCode;
    notifyListeners();
  }
}
