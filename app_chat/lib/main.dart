import 'package:flutter/material.dart';
import 'package:app_chat/config/theme/app_theme.dart';
import 'package:app_chat/presentation/chat/chat_screen.dart';

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
      theme: AppTheme(selector: 0).theme(),
      home: const ChatScreen(),
    );
  }
}
