import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:unixtime/unixtime.dart';

void log(dynamic arg) {
  var log = Logger();

  if (arg.runtimeType == List) {
    arg.forEach((item) {
      log.d(item);
    });
  } else {
    log.d(arg);
  }
}

String kelvinToDeg(dynamic kelvin) {
  String temp = '';
  if (kelvin.runtimeType == int || kelvin.runtimeType == double) {
    temp = (kelvin - 273.15).toStringAsFixed(1);
  } else {
    temp = 'error';
  }
  return temp;
}

String msConversion(double speed) {
  return (speed * 3.6).toStringAsFixed(1);
}

String getDay(String date) {
  var usedDate = DateTime.parse(date);
  String day = DateFormat('EEEE').format(usedDate);

  switch (day) {
    case 'Monday':
      day = 'Lundi';
      break;
    case 'Tuesday':
      day = 'Mardi';
      break;
    case 'Wednesday':
      day = 'Mercredi';
      break;
    case 'Thursday':
      day = 'Jeudi';
      break;
    case 'Friday':
      day = 'Vendredi';
      break;
    case 'Saturday':
      day = 'Samedi';
      break;
    case 'Sunday':
      day = 'Dimanche';
      break;
    default:
      return day;
  }
  return day;
}

String weatherImagePicker(int id, int sunset, int sunrise) {
  final timeNow = DateTime.now().unixtime;
  String result = "";
  if (timeNow > sunrise && timeNow < sunset) {
    switch (id) {
      case >= 200 && <= 299:
        result = 'thundery.png';
        break;
      case >= 300 && <= 310:
        result = 'rainy.png';
        break;
      case >= 311 && <= 399:
        result = 'cloud-drizzle.png';
        break;
      case >= 500 && <= 510:
        result = 'heavy-rain.png';
        break;
      case >= 511 && <= 599:
        result = 'heavy-rain.png';
        break;
      case >= 600 && <= 610:
        result = 'snow-big.png';
        break;
      case >= 611 && <= 699:
        result = 'snow.png';
        break;
      case >= 700 && <= 799:
        result = 'fog.png';
        break;
      case == 800:
        result = 'sun.png';
        break;
      case 801 || 802:
        result = 'sun-cloud.png';
        break;
      case 803 || 804:
        result = 'cloud.png';
        break;
      default:
        result = "";
    }
  } else {
    switch (id) {
      case >= 200 && <= 299:
        result = 'thundery.png';
        break;
      case >= 300 && <= 310:
        result = 'rainy.png';
        break;
      case >= 311 && <= 399:
        result = 'cloud-drizzle.png';
        break;
      case >= 500 && <= 510:
        result = 'heavy-rain.png';
        break;
      case >= 511 && <= 599:
        result = 'heavy-rain.png';
        break;
      case >= 600 && <= 610:
        result = 'snow-big.png';
        break;
      case >= 611 && <= 699:
        result = 'snow.png';
        break;
      case >= 700 && <= 799:
        result = 'fog.png';
        break;
      case == 800:
        result = 'moon.png';
        break;
      case 801 || 802:
        result = 'night-cloud.png';
        break;
      case 803 || 804:
        result = 'cloud.png';
        break;
      default:
        result = "";
    }
  }
  return 'assets/images/$result';
}

String backImagePicker(String weather, int sunset, int sunrise) {
  final timeNow = DateTime.now().unixtime;
  String result = "";

  if (timeNow > sunrise && timeNow < sunset) {
    switch (weather) {
      case "Thunderstorm":
        result = "thunder-back.jpeg";
        break;
      case "Drizzle":
        result = "drizzle-back.jpg";
        break;
      case "Rain":
        result = "rain-back.jpg";
        break;
      case "Snow":
        result = "snow-back.jpeg";
        break;
      case "Atmosphere":
        result = "fog-back.avif";
        break;
      case "Clear":
        result = "sun-back.jpg";
        break;
      case "Clouds":
        result = "cloud-back.jpg";
        break;
    }
  } else {
    switch (weather) {
      case "Drizzle" || "Rain" || "Snow" || "Atmosphere" || "Clouds":
        result = "night-cloud-back.jpeg";
        break;
      case "Thunderstorm":
        result = "night-thunder-back.avif";
        break;
      case "Clear":
        result = "night-clear-back.avif";
        break;
      default:
        result = "";
    }
  }

  return result;
}
