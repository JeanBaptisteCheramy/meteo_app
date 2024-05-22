import 'package:flutter/material.dart';

class LocationModel extends ChangeNotifier {
  Map<String, dynamic> location = {'city': ''};
  LocationModel({required this.location});

  void setCity(String city) {
    location['city'] = city;
    notifyListeners();
  }
}
