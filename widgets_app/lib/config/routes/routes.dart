import 'package:flutter/material.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/buttons/buttons_screen.dart';
import '../../presentation/screens/cards/cards.screen.dart';
import '../../presentation/screens/theme_changer/theme_changer.dart';
import '../../presentation/screens/progress/progress_screen.dart';

class AppRoutes {
  static int selectedColor = 1;

  static const initialRoute = '/';
  static const buttonsRoute = '/buttons';
  static const cardsRoute = '/cards';
  static const themeChangerRoute = '/theme-changer';
  static const progressRoute = '/progress';

  static final Map<String, Widget Function(BuildContext)> routes = {
    initialRoute: (context) => const HomeScreen(),
    buttonsRoute: (context) => const ButtonsScreen(),
    cardsRoute: (context) => const CardsScreen(),
    themeChangerRoute: (context) => ThemeChangerScreen(
      ontThemeChanged: (color) {
        AppRoutes.selectedColor = color;
      },
    ),
    progressRoute: (context) => const ProgressScreen(),
  };
}
