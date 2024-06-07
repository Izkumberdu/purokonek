import 'package:flutter/material.dart';
import 'package:purokonek/Screens/chat.dart';
import 'package:purokonek/Screens/homepage.dart';
import 'package:purokonek/Screens/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: const Onboarding(),
        routes: {
          '/onboarding': (context) => const Onboarding(),
          '/homepage': (context) => const Homepage(),
          '/chat': (context) => const ChatBot(),
        });
  }
}
