import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class FoodDetailScreen extends StatelessWidget {
  final String foodName;
  final int price;

  const FoodDetailScreen({Key? key, required this.foodName, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(foodName),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(foodName, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text('৳$price', style: TextStyle(fontSize: 22, color: AppColors.accent)),
            SizedBox(height: 24),
            Text('Food details and description go here.', style: TextStyle(fontSize: 16)),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  // TODO: Add to cart
                },
                child: Text('Add to Cart', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
