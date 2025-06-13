import 'package:flutter/material.dart';
import 'package:app_chat/routes/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat App Simulator')),
      body: Center(
        child: FilledButton(
          onPressed: () {
              Navigator.pushNamed(context, AppRoutes.chat);
          },
          child: Text('Start Chat'),
        ),
      ),
    );
  }
}
