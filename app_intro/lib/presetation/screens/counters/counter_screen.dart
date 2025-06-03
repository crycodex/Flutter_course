import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "50",
              style: TextStyle(fontSize: 100, fontWeight: FontWeight.w100),
            ),
            Text(
              "Clicks",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.plus_one, size: 50),
      ),
    );
  }
}
