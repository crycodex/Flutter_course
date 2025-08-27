import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './config/theme/app_theme.dart';
import './config/routes/routes.dart';
import './presentation/providers/theme_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (context, ref, child) {
          final selectedColor = ref.watch(themeProvider);
          final isDarkMode = ref.watch(isDarkModeProvider);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme(
              selectedColor: selectedColor,
              isDarkMode: isDarkMode,
            ).getTheme(),
            initialRoute: AppRoutes.initialRoute,
            routes: AppRoutes.routes,
          );
        },
      ),
    );
  }
}
