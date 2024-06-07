import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:purokonek/Constants/API_KEY.dart';
import 'package:purokonek/Screens/chat.dart';
import 'package:purokonek/Screens/homepage.dart';
import 'package:purokonek/Screens/onboarding.dart';

void main() {
  Gemini.init(apiKey: GEMINI_API_KEY);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const ChatBot(), routes: {
      '/onboarding': (context) => const Onboarding(),
      '/homepage': (context) => const Homepage(),
      '/chat': (context) => const ChatBot(),
    });
  }
}
