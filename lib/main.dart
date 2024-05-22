import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meteo_app/pages/home.dart';
import 'package:meteo_app/pages/locate.dart';
import 'package:meteo_app/store/location_store.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(locationStore.notifier).location['city'];

    return MaterialApp(
        title: "Météo App",
        debugShowCheckedModeBanner: false,
        // themeMode: ThemeMode.system,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueGrey,
            brightness: Brightness.light,
          ),
        ),
        home: location == null ? const HomePage() : const Locate());
  }
}
