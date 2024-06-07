import 'package:flutter/material.dart';
import 'package:meteo_app/services/services.dart';
import 'package:meteo_app/widgets/forecast_card.dart';

class MidSection extends StatelessWidget {
  const MidSection(this.data, {super.key});
  final Map data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(children: [ForecastCard(data['forecast'][0])]),
    );
  }
}
