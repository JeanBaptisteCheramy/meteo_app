import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meteo_app/models/location_model.dart';

final locationStore = ChangeNotifierProvider<LocationModel>((ref) {
  return LocationModel(
      location: {'city': '', 'stateCode': null, 'countryCode': null});
});
