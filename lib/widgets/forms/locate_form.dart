import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meteo_app/pages/home.dart';
import 'package:meteo_app/store/location_store.dart';

class LocateForm extends ConsumerStatefulWidget {
  const LocateForm({super.key});
  @override
  LocateFormState createState() {
    return LocateFormState();
  }
}

class LocateFormState extends ConsumerState<LocateForm> {
  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> locationController = {
    'city': TextEditingController(),
    'stateCode': TextEditingController(),
    'countryCode': TextEditingController(),
  };

  @override
  void dispose() {
    locationController['city'].dispose();
    locationController['stateCode'].dispose();
    locationController['countryCode'].dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: locationController['city'],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrez le nom de votre ville';
              }
              return null;
            },
          ),
          const Text('Ville'),
          TextFormField(
            controller: locationController['stateCode'],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrez le code de votre département';
              }
              return null;
            },
          ),
          const Text('Numéro du département'),
          TextFormField(
            controller: locationController['countryCode'],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrez le code de votre pays';
              }
              return null;
            },
          ),
          const Text('Numéro du pays'),
          Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ref.read(locationStore.notifier).setLocation(
                        locationController['city'].text,
                        int.parse(locationController['stateCode'].text),
                        int.parse(locationController['countryCode'].text));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                },
                child: const Text('Valider'),
              )),
        ],
      ),
    );
  }
}
