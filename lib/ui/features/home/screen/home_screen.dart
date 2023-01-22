import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Learning with events"),
      ),
      body: Container(
        color: Colors.amber,
        height: 300,
      ),
    );
  }
}
