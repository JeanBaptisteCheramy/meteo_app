import 'package:logger/logger.dart';

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

String kelvinToDeg(double kelvin) {
  String temp = (kelvin - 273.15).toStringAsFixed(1);
  return temp;
}

String weatherImagePicker(int id) {
  String result = "";
  switch (id) {
    case >= 200 && <= 299:
      result = 'thunder.png';
      break;
    case >= 300 && <= 310:
      result = 'drizzle.png';
      break;
    case >= 311 && <= 399:
      result = 'cloud-drizzle.png';
      break;
    case >= 500 && <= 6:
      result = 'humidity.png';
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
      result = 'fog.png';
      break;
    case 801 || 802:
      result = 'sun-cloud.png';
      break;
    case 803 || 804:
      result = 'cloud.png';
      break;
  }
  return 'assets/images/$result';
}
