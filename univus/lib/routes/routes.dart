import 'package:go_router/go_router.dart';
import 'package:univus/features/dashboard/view/dashboard_screen.dart';
import 'package:univus/features/login/view/login_screen.dart';
import 'package:univus/features/onboard/onboard_screen.dart';

final router = GoRouter(
  initialLocation: "/dashboard",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => OnboardScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => DashboardScreen(),
    ),
  ],
);