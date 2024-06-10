import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:meteo_app/widgets/day_forecast.dart';

class DownSection extends StatelessWidget {
  DownSection(this.data, {super.key});
  final List data;
  List<Widget> upcomingDays = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i <= 7; i++) {
      upcomingDays.add(DayForecast(data[i]));
    }

    return GlassContainer(
        blur: 6,
        color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromARGB(255, 199, 198, 255).withOpacity(0.2),
            Colors.blue.withOpacity(0.1),
          ],
        ),
        shape: BoxShape.rectangle,
        border: const Border.fromBorderSide(BorderSide.none),
        borderRadius: BorderRadius.circular(0),
        shadowStrength: 0.7,
        shadowColor: const Color.fromARGB(213, 255, 255, 255).withOpacity(0.3),
        child: Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            color: const Color.fromARGB(29, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: upcomingDays,
            )));
  }
}
