import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App Simulator',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Chat App Simulator')),
        body: Center(
          child: FilledButton(onPressed: () {}, child: Text('Start Chat')),
        ),
      ),
    );
  }
}
