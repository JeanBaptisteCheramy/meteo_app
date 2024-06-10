import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meteo_app/services/services.dart';
import 'package:meteo_app/store/location_store.dart';
import 'package:meteo_app/styles/texts_styles.dart';

class ForecastCard extends ConsumerWidget {
  const ForecastCard(this.data, {super.key});
  final dynamic data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var location = ref.watch(locationStore.notifier).location;
    final time = DateTime.parse(data['dt_txt']);
    final hour = time.hour;
    return SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${hour.toString()}h', style: TextsStyles.content),
            const Spacer(),
            Image(
              image: AssetImage(weatherImagePicker(
                  data['weather'][0]['id'],
                  location['weather']['sys']['sunset'],
                  location['weather']['sys']['sunrise'])),
              width: 40,
              height: 40,
            ),
            const Spacer(),
            Text("${kelvinToDeg(data['main']['temp'])} °C",
                style: TextsStyles.contentSM)
          ],
        ));
  }
}
