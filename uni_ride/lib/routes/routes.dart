import 'package:go_router/go_router.dart';
import 'package:uni_ride/features/dashboard/view/dashboard_screen.dart';

import '../components/shell.dart';
import '../features/login/view/login_screen.dart';
import '../features/onboard/onboard_screen.dart';
import '../features/profile/view/profile_screen.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: '/', builder: (context, state) => OnboardScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    /*  */ShellRoute(
      builder: (context, state, child) {
        return DashboardShell(child: child); // Your widget with bottom nav
      },
      routes: [
        GoRoute(
          path: '/dashboard',
          name: 'dashboard',
          pageBuilder:
              (context, state) => NoTransitionPage(child: DashboardScreen()),
        ),
        GoRoute(
          path: '/courses',
          name: 'courses',
          pageBuilder:
              (context, state) => NoTransitionPage(child: DashboardScreen()),
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          pageBuilder:
              (context, state) => NoTransitionPage(child: ProfileScreen()),
        ),
      ],
    ),
  ],
);
