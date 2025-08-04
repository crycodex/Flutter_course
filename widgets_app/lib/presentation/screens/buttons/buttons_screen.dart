import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons')),
      body: _ButtonsView(),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Wrap(
        direction: Axis.vertical,
        spacing: 10,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Elevated Button'),
          ),
          ElevatedButton(onPressed: null, child: Text("Disabled")),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.calendar_month),
            label: const Text("Icon"),
          ),
          FilledButton(onPressed: () {}, child: Text("Filled")),
          FilledButton.icon(
            onPressed: () {},
            label: Text("Fillet Button"),
            icon: Icon(Icons.calendar_month),
          ),
          OutlinedButton(onPressed: () {}, child: Text("Outlined")),
          OutlinedButton.icon(
            onPressed: () {},
            label: Text("Outlined Button"),
            icon: Icon(Icons.calendar_month),
          ),
          TextButton(onPressed: () {}, child: Text("Text Button")),
          TextButton.icon(
            onPressed: () {},
            label: Text("Text Button"),
            icon: Icon(Icons.calendar_month),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.calendar_month)),
          IconButton.filled(onPressed: () {}, icon: Icon(Icons.calendar_month)),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.calendar_month),
          ),
        ],
      ),
    );
  }
}
