import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat App Simulator')),
      body: Center(
        child: FilledButton(
          onPressed: () {
            Get.toNamed("/chat");
          },
          child: Text('Start Chat'),
        ),
      ),
    );
  }
}
