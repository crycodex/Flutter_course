import 'package:flutter/material.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = "snack_bar_screen";

  const SnackBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar')),
      body: Center(
        child: Column(
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'Flutter Widgets App',
                  applicationIcon: const Icon(Icons.adb),
                  children: [Text('Ver Licencias')],
                );
              },
              child: const Text('Licencias Usadas'),
            ),
            FilledButton.tonal(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Hola Mundo'),
                    content: const Text('Hola Mundo'),
                    actions: [
                      TextButton(onPressed: () {}, child: const Text('OK')),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Mostral Dialog'),
            ),
          ],
        ),
      ),
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
