import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Text('Student Profile & Settings', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
