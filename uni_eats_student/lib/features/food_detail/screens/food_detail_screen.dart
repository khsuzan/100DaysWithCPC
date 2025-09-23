import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class FoodDetailScreen extends StatelessWidget {
  final String name;
  final String price;
  final String description;

  const FoodDetailScreen({
    Key? key,
    required this.name,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(name),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
            SizedBox(height: 12),
            Text(
              price,
              style: TextStyle(
                fontSize: 22,
                color: AppColors.accent,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 24),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.text,
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  // TODO: Implement order functionality
                },
                child: Text(
                  'Order Now',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
