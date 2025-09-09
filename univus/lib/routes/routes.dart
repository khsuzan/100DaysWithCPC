import 'package:go_router/go_router.dart';
import 'package:univus/features/dashboard/view/dashboard_screen.dart';
import 'package:univus/features/login/view/login_screen.dart';
import 'package:univus/features/onboard/onboard_screen.dart';

import '../components/shell.dart';
import '../features/routine/view/routine_screen.dart';

final router = GoRouter(
  initialLocation: "/routine",
  routes: [
    GoRoute(path: '/', builder: (context, state) => OnboardScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    ShellRoute(
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
          path: '/routine',
          name: 'routine',
          pageBuilder:
              (context, state) => NoTransitionPage(child: RoutineScreen()),
        ),
        GoRoute(
          path: '/courses',
          name: 'courses',
          pageBuilder:
              (context, state) => NoTransitionPage(child: DashboardScreen()),
        ),
        GoRoute(
          path: '/fees',
          name: 'fees',
          pageBuilder:
              (context, state) => NoTransitionPage(child: DashboardScreen()),
        ),
      ],
    ),
  ],
);
