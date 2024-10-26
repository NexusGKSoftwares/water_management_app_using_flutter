import 'package:flutter/material.dart';

class BillPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Payment'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildOutstandingBillCard(),
            SizedBox(height: 20),
            _buildPaymentOptions(context),
            SizedBox(height: 20),
            _buildPaymentHistory(),
          ],
        ),
      ),
    );
  }

  // Outstanding Bill Card
  Widget _buildOutstandingBillCard() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
            Text(
              'Payment Options',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildPaymentOption(context, 'Pay via M-Pesa', Icons.phone_android, Colors.green),
            _buildPaymentOption(context, 'Pay via Credit/Debit Card', Icons.credit_card, Colors.blue),
            _buildPaymentOption(context, 'Pay via Bank Transfer', Icons.account_balance, Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(BuildContext context, String title, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, size: 30, color: color),
      title: Text(title, style: TextStyle(fontSize: 18)),
      trailing: Icon(Icons.arrow_forward_ios, size: 18),
      onTap: () {
        // Implement navigation to payment method details
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Payment Option Selected'),
            content: Text('You selected $title'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
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
            Text(
              'Payment History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
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
      title: Text(date, style: TextStyle(fontSize: 16)),
      subtitle: Text(method, style: TextStyle(fontSize: 14, color: Colors.grey)),
      trailing: Text(amount, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}
