import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class FavouriteItemScreen extends StatelessWidget {
  final List<Map<String, dynamic>> favouriteItems = [
    {'name': 'Pizza', 'price': 200},
    {'name': 'Pasta', 'price': 150},
    {'name': 'Chicken Burger', 'price': 120},
  ];

  FavouriteItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Favourite Items'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: favouriteItems.length,
          itemBuilder: (context, index) {
            final item = favouriteItems[index];
            return Card(
              color: AppColors.menuCard,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(item['name'], style: TextStyle(fontSize: 18)),
                trailing: Text('৳${item['price']}', style: TextStyle(fontSize: 16, color: AppColors.accent)),
                // You can add a button/icon here for removing from favourites or adding to cart
              ),
            );
          },
        ),
      ),
    );
  }
}
