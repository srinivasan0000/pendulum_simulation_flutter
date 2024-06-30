import 'package:flutter/material.dart';
import 'package:pendulum_simulation_flutter/pendulaum_page.dart';

void main() {
  runApp(const PendulumApp());
}

class PendulumApp extends StatelessWidget {
  const PendulumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Pendulum Simulation Sample')),
        body: const PendulumSimulationPage(),
      ),
    );
  }
}
