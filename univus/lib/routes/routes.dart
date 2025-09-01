import 'package:go_router/go_router.dart';
import 'package:univus/features/onboard/onboard_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => OnboardScreen(),
    ),
  ],
);