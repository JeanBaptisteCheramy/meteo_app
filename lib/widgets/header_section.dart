import 'package:flutter/material.dart';
import 'package:meteo_app/services/services.dart';
import 'package:meteo_app/styles/texts_styles.dart';

class Header extends StatelessWidget {
  const Header(this.data, {super.key});
  final Map data;

  @override
  Widget build(BuildContext context) {
    debugPrint(data.toString());
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/${backImagePicker(data['weather']['weather'][0]['main'], data['weather']['sys']['sunset'], data['weather']['sys']['sunrise'])}'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
          color: const Color.fromARGB(48, 132, 197, 254),
        ),
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
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(weatherImagePicker(
                              data['weather']['weather'][0]['id'])),
                          height: 50,
                          width: 50,
                        ),
                        Text(
                            "${kelvinToDeg(data['weather']['main']['temp'])}°C",
                            style: TextsStyles.titleMD),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "Min: ${kelvinToDeg(data['weather']['main']['temp_min'])}°C",
                            style: TextsStyles.content),
                        Text(
                            "Max: ${kelvinToDeg(data['weather']['main']['temp_max'])}°C",
                            style: TextsStyles.content),
                      ],
                    ),
                    Text(
                        "Vent: ${msConversion(data['weather']['wind']['speed'])}km/h",
                        style: TextsStyles.content),
                  ],
                ),
              ))
        ]));
  }
}
