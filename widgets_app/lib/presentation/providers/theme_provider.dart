import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<int>((ref) => 1);

//modo claro y modo oscuro
final isDarkModeProvider = StateProvider<bool>((ref) => false);
