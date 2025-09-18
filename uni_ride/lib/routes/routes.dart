import 'package:go_router/go_router.dart';
import 'package:uni_ride/features/dashboard/view/dashboard_screen.dart';
import 'package:uni_ride/features/map/view/map_screen.dart';
import 'package:uni_ride/features/registration/view/registration_screen.dart';
import 'package:uni_ride/features/schedule/view/schedule_screen.dart';
import 'package:uni_ride/features/favorites/view/favorites_screen.dart';

import '../components/shell.dart';
import '../features/login/view/login_screen.dart';
import '../features/onboard/view/onboard_screen.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: '/', builder: (context, state) => OnboardScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/registration', builder: (context, state) => RegistrationScreen()),
    ShellRoute(
      builder: (context, state, child) {
        return DashboardShell(child: child); // Widget with bottom nav
      },
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder: (context, state) => NoTransitionPage(child: DashboardScreen()),
        ),
        GoRoute(
          path: '/map',
          name: 'map',
          pageBuilder: (context, state) => NoTransitionPage(child: MapScreen()),
        ),
        GoRoute(
          path: '/schedule',
          name: 'schedule',
          pageBuilder: (context, state) => NoTransitionPage(child: ScheduleScreen()),
        ),
        GoRoute(
          path: '/favorites',
          name: 'favorites',
          pageBuilder: (context, state) => NoTransitionPage(child: FavoritesScreen()),
        ),
      ],
    ),
  ],
);
