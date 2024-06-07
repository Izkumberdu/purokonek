import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:purokonek/Constants/API_KEY.dart';
import 'package:purokonek/Functions/initGoogleMaps.dart';
import 'package:purokonek/Screens/chat.dart';
import 'package:purokonek/Screens/homepage.dart';
import 'package:purokonek/Screens/maps_page.dart';
import 'package:purokonek/Screens/onboarding.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:purokonek/screens/health.dart';

void main() async {
  Gemini.init(apiKey: GEMINI_API_KEY);
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    final GoogleMapsFlutterPlatform mapsImplementation =
        GoogleMapsFlutterPlatform.instance;
    if (mapsImplementation is GoogleMapsFlutterAndroid) {
      mapsImplementation.useAndroidViewSurface = true;
      initializeMapRenderer();
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const Homepage(), routes: {
      '/onboarding': (context) => const Onboarding(),
      '/homepage': (context) => const Homepage(),
      '/chat': (context) => const ChatBot(),
      '/mapspage': (context) => const MapsPage(),
      '/healthpage': (context) => const HealthPage()
    });
  }
}
