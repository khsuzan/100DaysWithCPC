import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Uni Eats Home'),
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Text('Welcome to Uni Eats!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
