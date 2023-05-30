import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("Arthur"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            i = i + 1;
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          i.toString(),
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 72,
          ),
        ),
      ),
    );
  }
}

//Container
//Text
//Scaffold
//AppBar
//Icon
//FloatingActionButton
//Center
