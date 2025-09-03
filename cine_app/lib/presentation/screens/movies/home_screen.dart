import 'package:flutter/material.dart';
import 'package:cine_app/config/constants/env.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "home-screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cine App")
      ),
      body: Center(child: Text(Env.apiKey)),
    );
  }
}
