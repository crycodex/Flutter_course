import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static const name = "animated_screen";

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 100;
  double height = 100;
  Color color = Colors.red;
  double borderRadius = 20;

  void changeShape() {
    final random = Random();
    width =
        random.nextInt(400).toDouble() +
        100; // obtener un numero entre 100 y 400
    height = random.nextInt(400).toDouble() + 100;
    color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    borderRadius = random
        .nextInt(100)
        .toDouble(); // obtener un numero entre 0 y 100
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 3),
          curve: Curves.easeInOut,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeShape();
        },
        child: const Icon(Icons.play_circle_outline),
      ),
    );
  }
}
