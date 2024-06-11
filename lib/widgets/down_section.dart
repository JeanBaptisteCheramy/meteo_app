import 'package:flutter/material.dart';
import 'package:meteo_app/styles/texts_styles.dart';
import 'package:meteo_app/widgets/day_forecast.dart';

class DownSection extends StatelessWidget {
  DownSection(this.data, {super.key});
  final List data;
  final List<Widget> upcomingDays = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i <= 7; i++) {
      upcomingDays.add(DayForecast(data[i]));
    }

    return Container(
        height: 350,
        width: 400,
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.1,
                0.9,
              ],
              colors: [
                Color.fromARGB(201, 36, 95, 143),
                Color.fromARGB(217, 38, 62, 96),
              ],
            )),
        child: Column(children: [
          const Text(
            'Jours à venir',
            style: TextsStyles.titleSM,
            textAlign: TextAlign.center,
          ),
          Expanded(
              child: ListView(
                  primary: false,
                  padding: const EdgeInsets.all(2),
                  children: upcomingDays))
        ]));
  }
}
