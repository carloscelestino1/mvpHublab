import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Contador:',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const Text(
              'counter',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Incrementar'),
            ),
          ],
        ),
      ),
    );
  }
}
