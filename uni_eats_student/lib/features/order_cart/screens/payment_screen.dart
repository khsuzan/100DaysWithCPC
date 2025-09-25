import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class PaymentScreen extends StatelessWidget {
  final int totalAmount;

  const PaymentScreen({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Payment Information'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Amount:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('৳$totalAmount', style: TextStyle(fontSize: 24, color: AppColors.accent, fontWeight: FontWeight.bold)),
            SizedBox(height: 24),
            Text('Select Payment Method:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.credit_card, color: AppColors.primary),
              title: Text('Credit/Debit Card'),
              onTap: () {
                // TODO: Implement card payment
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet, color: AppColors.primary),
              title: Text('Mobile Banking'),
              onTap: () {
                // TODO: Implement mobile banking payment
              },
            ),
            ListTile(
              leading: Icon(Icons.money, color: AppColors.primary),
              title: Text('Cash on Delivery'),
              onTap: () {
                // TODO: Implement cash on delivery
              },
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
                  // TODO: Confirm payment and place order
                },
                child: Text('Confirm Payment', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
