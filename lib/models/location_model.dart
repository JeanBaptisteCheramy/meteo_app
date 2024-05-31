import 'package:flutter/material.dart';
import 'package:meteo_app/models/coordinates_model.dart';
import 'package:meteo_app/models/weather_infos_model.dart';

class LocationModel extends ChangeNotifier {
  Map<String, dynamic> location = {
    'city': '',
    'longitude': null,
    'latitude': null,
    'weather': {},
  };
  LocationModel({required this.location});

  Future<void> setLocation(String city, int stateCode, int countryCode) async {
    Coordinates coordinates =
        await getCoordinates(city, stateCode, countryCode);

    location['city'] = coordinates.name;
    location['longitude'] = coordinates.longitude;
    location['latitude'] = coordinates.latitude;

    WeatherInfos infos =
        await getWeather(location['latitude'], location['longitude']);

    location['weather']['coord'] = infos.coord;
    location['weather']['weather'] = infos.weather;
    location['weather']['main'] = infos.main;
    location['weather']['wind'] = infos.wind;
    location['weather']['clouds'] = infos.clouds;
    location['weather']['sys'] = infos.sys;
    location['weather']['name'] = infos.name;


    notifyListeners();
  }
}
