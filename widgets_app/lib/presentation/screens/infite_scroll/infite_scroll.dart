import 'package:flutter/material.dart';

class InfiniteScrollScreen extends StatelessWidget {
  static const name = "infinite_scroll_screen";

  const InfiniteScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Infinite Scroll')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return FadeInImage(
            key: Key('image_$index'),
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
            placeholder: const AssetImage('assets/jar.gif'),
            image: NetworkImage(
              'https://picsum.photos/id/${index + 1}/500/300',
            ),
          );
        },
      ),
    );
  }
}
