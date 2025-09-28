import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Text('Food Menu List', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
