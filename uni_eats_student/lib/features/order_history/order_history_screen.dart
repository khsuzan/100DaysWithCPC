import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Order History'),
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Text('Your previous orders will appear here.', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
