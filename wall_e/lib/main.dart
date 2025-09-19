
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'screens/home/home_screen.dart';
import 'screens/wallpaper_view/wallpaper_view_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFF2B151A),
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color(0xFF2B151A),
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(const GlobalApp());
}

class GlobalApp extends StatelessWidget {
  const GlobalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
          builder: (context, widget) {
            return GlobalMaterial(child: widget!);
          },
        );
      },
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/wallpaper-view',
      builder: (context, state) {
        final imagePath = state.uri.queryParameters['imagePath'] ?? '';
        return WallpaperViewScreen(imagePath: imagePath);
      },
    ),
  ],
);

class GlobalMaterial extends StatelessWidget {
  final Widget child;
  const GlobalMaterial({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF2B151A),
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Color(0xFF2B151A),
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: child,
    );
  }
}

// ...existing code...
