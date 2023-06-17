import 'package:app_hub_match/screen_manager_app/screen_manager.dart';
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
      home: ScreenManager(),
      debugShowCheckedModeBanner: false,
    );
  }
}
