import 'package:flutter/material.dart';
import 'package:meteo_app/widgets/forms/locate_form.dart';

class Locate extends StatelessWidget {
  const Locate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
      decoration: const BoxDecoration(color: Colors.white),
      child: const Column(
        children: [
          Text(
            'Entrez votre localisation',
            textAlign: TextAlign.center,
          ),
          LocateForm()
        ],
      ),
    ));
  }
}
