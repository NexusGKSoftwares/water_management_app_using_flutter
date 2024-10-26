import 'package:flutter/material.dart';
import 'mpesa_payment_screen.dart';
import 'card_payment_screen.dart';
import 'bank_payment_screen.dart';

class BillPaymentScreen extends StatelessWidget {
  const BillPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Payment'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildOutstandingBillCard(),
            const SizedBox(height: 20),
            _buildPaymentOptions(context),
            const SizedBox(height: 20),
            _buildPaymentHistory(),
          ],
        ),
      ),
    );
  }

  // Outstanding Bill Card
  Widget _buildOutstandingBillCard() {
    return const Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Outstanding Bill',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Amount Due: Kshs. 50.00',
              style: TextStyle(fontSize: 24, color: Colors.redAccent, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Due Date: October 31, 2024',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // Payment Options
  Widget _buildPaymentOptions(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Options',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildPaymentOption(context, 'Pay via M-Pesa', Icons.phone_android, Colors.green, MpesaPaymentScreen()),
            _buildPaymentOption(context, 'Pay via Credit/Debit Card', Icons.credit_card, Colors.blue, CardPaymentScreen()),
            _buildPaymentOption(context, 'Pay via Bank Transfer', Icons.account_balance, Colors.orange, BankPaymentScreen()),
          ],
        ),
      ),
    );
  }

  // Payment Option
  Widget _buildPaymentOption(BuildContext context, String title, IconData icon, Color color, Widget paymentPage) {
    return ListTile(
      leading: Icon(icon, size: 30, color: color),
      title: Text(title, style: const TextStyle(fontSize: 18)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      onTap: () {
        // Navigate to the respective payment page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => paymentPage,
          ),
        );
      },
    );
  }

  // Payment History
  Widget _buildPaymentHistory() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildPaymentHistoryItem('October 1, 2024', 'Kshs. 40.00', 'M-Pesa'),
            _buildPaymentHistoryItem('September 1, 2024', 'Kshs. 35.00', 'Credit Card'),
            _buildPaymentHistoryItem('August 1, 2024', 'Kshs. 45.00', 'Bank Transfer'),
          ],
        ),
      ),
    );
  }

  // Individual Payment History Item
  Widget _buildPaymentHistoryItem(String date, String amount, String method) {
    return ListTile(
      title: Text(date, style: const TextStyle(fontSize: 16)),
      subtitle: Text(method, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      trailing: Text(amount, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}
