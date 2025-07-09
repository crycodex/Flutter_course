import 'package:flutter/material.dart';
import 'package:sim_tiktok/config/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiktok Clone',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: Scaffold(
        appBar: AppBar(title: Text('Tiktok Clone')),
        body: Center(child: Text('Hello, World!')),
      ),
    );
  }
}
