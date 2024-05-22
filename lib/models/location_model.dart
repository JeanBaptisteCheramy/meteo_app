import 'package:flutter/material.dart';

class LocationModel extends ChangeNotifier {
  Map<String, dynamic> location = {
    'city': '',
    'stateCode': null,
    'countryCode': null
  };
  LocationModel({required this.location});

  void setLocation(String city, int stateCode, int countryCode) {
    location['city'] = city;
    location['stateCode'] = stateCode;
    location['countryCode'] = countryCode;
    notifyListeners();
  }
}
