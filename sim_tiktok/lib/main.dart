import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sim_tiktok/config/app_theme.dart';
import 'package:sim_tiktok/presentation/screens/discover/discover_screen.dart';
//providers
import 'package:sim_tiktok/presentation/providers/discover_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider()..loadNextPage(),
        ),
      ],
      child: MaterialApp(
        title: 'Tiktok Clone',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
