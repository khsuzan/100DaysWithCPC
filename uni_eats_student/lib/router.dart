import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/splash/splash_screen.dart';
import 'features/home/home_screen.dart';
import 'features/menu/menu_screen.dart';
import 'features/food_detail/food_detail_screen.dart';
import 'features/order_cart/screens/order_cart_screen.dart';
import 'features/order_cart/screens/payment_screen.dart';
import 'features/order_cart/screens/favourite_item_screen.dart';
import 'features/profile/profile_screen.dart';
import 'features/order_history/order_history_screen.dart';
import 'features/auth/login_screen.dart';
import 'features/auth/signup_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/menu',
      builder: (context, state) => const MenuScreen(),
    ),
    GoRoute(
      path: '/food_detail',
      builder: (context, state) => FoodDetailScreen(
        foodName: state.extra is Map ? (state.extra as Map)['foodName'] ?? '' : '',
        price: state.extra is Map ? (state.extra as Map)['price'] ?? 0 : 0,
      ),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => OrderCartScreen(),
    ),
    GoRoute(
      path: '/payment',
      builder: (context, state) => PaymentScreen(
        totalAmount: state.extra is int ? state.extra as int : 0,
      ),
    ),
    GoRoute(
      path: '/favourites',
      builder: (context, state) => FavouriteItemScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/order_history',
      builder: (context, state) => const OrderHistoryScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    ),
  ],
);
