import 'package:flutter/material.dart';
import 'package:app_counter/presetation/screens/counters/counter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.grey),
      home: CounterScreen(),
    );
  }
}
