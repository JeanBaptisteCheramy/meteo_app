import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meteo_app/services/services.dart';
import 'package:meteo_app/store/location_store.dart';
import 'package:meteo_app/widgets/header_section.dart';
import 'package:meteo_app/widgets/mid_section.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var location = ref.watch(locationStore.notifier).location;

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/${backImagePicker(ref.watch(locationStore.notifier).location['weather']['weather'][0]['main'], ref.watch(locationStore.notifier).location['weather']['sys']['sunset'], ref.watch(locationStore.notifier).location['weather']['sys']['sunrise'])}'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.8),
            BlendMode.dstATop,
          ),
        ),
        color: const Color.fromARGB(48, 132, 197, 254),
      ),
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(
        children: [
          Header(location),
          MidSection(location['forecast']),
        ],
      ),
    ));
  }
}
