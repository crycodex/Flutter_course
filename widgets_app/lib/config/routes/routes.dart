import 'package:flutter/material.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/buttons/buttons_screns.dart';

class AppRoutes {
  static const initialRoute = '/';
  static const buttonsRoute = '/buttons';

  static final Map<String, Widget Function(BuildContext)> routes = {
    initialRoute: (context) => const HomeScreen(),
    buttonsRoute: (context) => const ButtonsScreen(),
  };
}