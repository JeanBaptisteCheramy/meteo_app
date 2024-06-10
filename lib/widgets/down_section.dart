import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:meteo_app/services/services.dart';

class DownSection extends StatelessWidget {
  const DownSection(this.data, {super.key});
  final List data;
  final double height = 150;

  @override
  Widget build(BuildContext context) {
    log(data);
    return GlassContainer(
        height: height,
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
            height: height,
            color: const Color.fromARGB(29, 0, 0, 0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [],
            )));
  }
}
