import 'package:app_hub_match/screens/edit_profile_screen.dart';
import 'package:app_hub_match/screens/selection_profile_screen.dart';
import 'package:app_hub_match/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
