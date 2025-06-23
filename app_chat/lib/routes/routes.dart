import 'package:flutter/material.dart';

//VISTAS
import '../presentation/welcome_screen.dart';
import '../presentation/chat/chat_screen.dart';
import '../presentation/screens/credits_screen.dart';

class AppRoutes {
  static const String welcome = '/welcome';
  static const String chat = '/chat';
  static const String credits = '/credits';

  static Map<String, Widget Function(BuildContext)> get pages => {
    welcome: (context) => const WelcomeScreen(),
    chat: (context) => const ChatScreen(),
    credits: (context) => const CreditsScreen(),
  };
}
