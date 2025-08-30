import 'package:go_router/go_router.dart';
import 'package:cine_app/presentation/screens/screens.dart';

final appRoutes = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ]
);