import 'package:get/get.dart';

//VISTAS
import '../presentation/welcome_screen.dart';
import '../presentation/chat/chat_screen.dart';

class AppRoutes {
  static const String welcome = '/welcome';
  static const String chat = '/chat';

  static final List<GetPage> pages = [
    GetPage(name: welcome, page: () => WelcomeScreen()),
    GetPage(name: chat, page: () => ChatScreen()),
  ];
}
