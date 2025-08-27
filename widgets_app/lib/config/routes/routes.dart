import 'package:flutter/material.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/buttons/buttons_screen.dart';
import '../../presentation/screens/cards/cards.screen.dart';
import '../../presentation/screens/theme_changer/theme_changer.dart';
import '../../presentation/screens/progress/progress_screen.dart';
import '../../presentation/screens/snackbar/snack_bar_screen.dart';
import '../../presentation/screens/animated/animated_screen.dart';
import '../../presentation/screens/ui_controls/ui_controls_screen.dart';
import '../../presentation/screens/app_tutorial/app_tutorial_screen.dart';
import '../../presentation/screens/infite_scroll/infite_scroll.dart';

class AppRoutes {
  static int selectedColor = 1;

  static const initialRoute = '/';
  static const buttonsRoute = '/buttons';
  static const cardsRoute = '/cards';
  static const themeChangerRoute = '/theme-changer';
  static const progressRoute = '/progress';
  static const snackbarRoute = '/snackbar';
  static const animatedRoute = '/animated-container';
  static const uiControlsRoute = '/ui-controls';
  static const appTutorialRoute = '/app-tutorial';
  static const infiniteScrollRoute = '/infinite-scroll';

  static final Map<String, Widget Function(BuildContext)> routes = {
    initialRoute: (context) => HomeScreen(),
    buttonsRoute: (context) => const ButtonsScreen(),
    cardsRoute: (context) => const CardsScreen(),
    themeChangerRoute: (context) => ThemeChangerScreen(
      ontThemeChanged: (color) {
        AppRoutes.selectedColor = color;
      },
    ),
    progressRoute: (context) => const ProgressScreen(),
    snackbarRoute: (context) => const SnackBarScreen(),
    animatedRoute: (context) => const AnimatedScreen(),
    uiControlsRoute: (context) => const UiControlsScreen(),
    appTutorialRoute: (context) => const AppTutorialScreen(),
    infiniteScrollRoute: (context) => const InfiniteScrollScreen(),
  };
}
