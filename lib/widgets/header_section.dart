import 'package:flutter/material.dart';
import 'package:meteo_app/services/services.dart';
import 'package:meteo_app/styles/texts_styles.dart';

class Header extends StatelessWidget {
  const Header(this.data, {super.key});
  final Map data;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
        width: double.infinity,
        child: Column(children: [
          SizedBox(
            height: 80,
            child: Text(data['city'], style: TextsStyles.titleXL),
          ),
          FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(121, 0, 0, 0),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(weatherImagePicker(
                              data['weather']['weather'][0]['id'])),
                          height: 60,
                          width: 60,
                        ),
                        Text(
                            "${kelvinToDeg(data['weather']['main']['temp'])}°C",
                            style: TextsStyles.titleMD),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                            "Min: ${kelvinToDeg(data['weather']['main']['temp_min'])}°C",
                            style: TextsStyles.content),
                        Text(
                            "Max: ${kelvinToDeg(data['weather']['main']['temp_max'])}°C",
                            style: TextsStyles.content),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                        "Vent: ${msConversion(data['weather']['wind']['speed'])} km/h",
                        style: TextsStyles.content),
                  ],
                ),
              ))
        ]));
  }
}
