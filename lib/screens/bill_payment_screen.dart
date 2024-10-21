import 'package:flutter/material.dart';

class BillPaymentScreen extends StatelessWidget {
  const BillPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bill Payment',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // Current Bill
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Current Bill: KES 2,500.00',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          // Payment Button
          ElevatedButton(
            onPressed: () {
              // Add functionality to pay the bill
            },
            child: const Text('Pay Now'),
          ),
        ],
      ),
    );
  }
}
