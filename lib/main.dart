import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/home_screen.dart';

void main() {
  runApp(const Aplication());
}

class Aplication extends StatelessWidget {
  const Aplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
