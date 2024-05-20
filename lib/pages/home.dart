import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:meteo_app/widgets/header_section.dart';

var logger = Logger();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void fonction() {
    logger.f('salut');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 53, 85, 181),
              Color.fromARGB(255, 42, 12, 81),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.0, 0.9),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: const Column(
        children: [Header()],
      ),
    ));
  }
}
