import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class OrderCartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {'name': 'Chicken Burger', 'price': 120, 'quantity': 1},
    {'name': 'French Fries', 'price': 60, 'quantity': 2},
  ];

  OrderCartScreen({Key? key}) : super(key: key);

  int get totalPrice => cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Order Cart'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    color: AppColors.menuCard,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(item['name'], style: TextStyle(fontSize: 18)),
                      subtitle: Text('Quantity: ${item['quantity']}'),
                      trailing: Text('৳${item['price'] * item['quantity']}',
                          style: TextStyle(fontSize: 16, color: AppColors.accent)),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('৳$totalPrice', style: TextStyle(fontSize: 20, color: AppColors.accent, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  // TODO: Implement checkout functionality
                },
                child: Text('Checkout', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
