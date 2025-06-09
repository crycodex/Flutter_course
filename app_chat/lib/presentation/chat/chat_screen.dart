import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App Simulator'),
        centerTitle: false,
        titleSpacing: 0,
        toolbarHeight: 50,
        backgroundColor: Colors.grey,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(backgroundColor: Colors.grey, child: Text('A')),
        ),
      ),
      body: Center(
        child: FilledButton(onPressed: () {}, child: Text('Start Chat')),
      ),
    );
  }
}
