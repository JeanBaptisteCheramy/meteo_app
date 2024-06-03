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
