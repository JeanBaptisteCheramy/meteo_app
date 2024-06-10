import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meteo_app/services/services.dart';
import 'package:meteo_app/styles/texts_styles.dart';

class DayForecast extends ConsumerWidget {
  const DayForecast(this.data, {super.key});
  final dynamic data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log(data);
    return SizedBox(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(getDay(data['datetime']), style: TextsStyles.content),
        const Image(
          image: AssetImage('assets/images/sun.png'),
          width: 50,
          height: 50,
        ),
        Text("Min: ${data['tmin']} °C - Max: ${data['tmax']} °C",
            style: TextsStyles.content)
      ],
    ));
  }
}
