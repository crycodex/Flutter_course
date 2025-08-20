import 'package:flutter/material.dart';

class AnimatedScreen extends StatelessWidget {
  static const name = "animated_screen";

  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 5),
          curve: Curves.easeInOutCubic,
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.play_circle_outline),
      ),
    );
  }
}
