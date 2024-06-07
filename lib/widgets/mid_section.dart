import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:meteo_app/widgets/forecast_card.dart';

class MidSection extends StatelessWidget {
  const MidSection(this.data, {super.key});
  final Map data;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: 200,
      // width: 200,
      blur: 4,
      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.6),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.2),
          Colors.blue.withOpacity(0.3),
        ],
      ),
      //--code to remove border
      border: const Border.fromBorderSide(BorderSide.none),
      shadowStrength: 5,

      shadowColor: Colors.white.withOpacity(0.6),
      child: Row(children: [ForecastCard(data['forecast'][0])]),
    );
  }
}
