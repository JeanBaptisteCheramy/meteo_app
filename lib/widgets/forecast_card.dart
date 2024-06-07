import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard(this.data, {super.key});
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    debugPrint(data.toString());
    return const Column(
      children: [
        Text('heure'),
        Image(
          image: AssetImage('assets/images/sun.png'),
          width: 40,
          height: 40,
        ),
        Text("temps °C")
      ],
    );
  }
}
