import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> menuItems = [
    {'name': 'Chicken Burger', 'price': '৳120'},
    {'name': 'Veg Sandwich', 'price': '৳80'},
    {'name': 'French Fries', 'price': '৳60'},
    {'name': 'Fruit Juice', 'price': '৳50'},
    {'name': 'Coffee', 'price': '৳40'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('UniEats Student'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Foods',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return Card(
                    color: AppColors.menuCard,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(item['name'] ?? '',
                          style: TextStyle(fontSize: 18)),
                      trailing: Text(item['price'] ?? '',
                          style: TextStyle(
                              fontSize: 16, color: AppColors.accent)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
