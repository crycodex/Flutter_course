import 'package:flutter/material.dart';
import 'package:app_chat/config/theme/app_theme.dart';
import 'package:app_chat/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:app_chat/presentation/providers/chat_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        title: 'Chat App Simulator',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selector: 1).theme(),
        initialRoute: AppRoutes.welcome,
        routes: AppRoutes.pages,
      ),
    );
  }
}
