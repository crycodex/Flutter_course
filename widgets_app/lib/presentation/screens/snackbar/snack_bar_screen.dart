import 'package:flutter/material.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = "snack_bar_screen";

  const SnackBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar')),
      body: Center(child: Column(children: [Text('Snackbar')])),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Hola Mundo'),
              action: SnackBarAction(label: 'OK', onPressed: () {}),
            ),
          );
        },
        label: const Text('Show Snackbar'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
