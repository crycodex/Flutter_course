import 'package:flutter/material.dart';
import 'package:cine_app/config/theme/app_theme.dart';
import 'package:cine_app/config/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRoutes,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      title: "Cine App",
    );
  }
}
