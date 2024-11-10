import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BillPaymentScreen extends StatefulWidget {
  final String userId;

  const BillPaymentScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _BillPaymentScreenState createState() => _BillPaymentScreenState();
}

class _BillPaymentScreenState extends State<BillPaymentScreen> {
  late Future<Map<String, dynamic>> billData;

  // Replace with the actual URL for generating and fetching user bill details
  final String _billUrl = 'http://localhost/pure/generate_bill.php';

  @override
  void initState() {
    super.initState();
    billData = _fetchUserBill();
  }

  Future<Map<String, dynamic>> _fetchUserBill() async {
    try {
      final response = await http.get(Uri.parse('$_billUrl?userId=${widget.userId}'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data['success']) {
          return data['billDetails'];
        } else {
          throw Exception(data['message']);
        }
      } else {
        throw Exception('Failed to load bill data');
      }
    } catch (e) {
      print('Error fetching bill data: $e');
      throw Exception('Failed to load bill data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Payment'),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: billData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No bill data available'));
          } else {
            final bill = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBillSummary(bill),
                  const SizedBox(height: 20),
                  _buildPaymentOptions(context),
                  const SizedBox(height: 20),
                  _buildPaymentHistory(bill['paymentHistory']),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildBillSummary(Map<String, dynamic> bill) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Billing Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildInfoRow('Previous Balance', 'Ksh ${bill['previous_balance']}'),
            _buildInfoRow('Previous Reading', bill['previous_reading']),
            _buildInfoRow('Current Reading', bill['current_reading']),
            _buildInfoRow('Consumed Units', '${bill['consumed_units']} @ 150/unit'),
            _buildInfoRow('Standing Charge', 'Ksh 300'),
            const Divider(),
            _buildInfoRow('Total Amount Due', 'Ksh ${bill['amount_due']}', isTotal: true),
            const SizedBox(height: 10),
            Text(
              'Due Date: ${bill['due_date']}',
              style: const TextStyle(fontSize: 16, color: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }

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
            _buildPaymentOption('Pay via M-Pesa', Icons.phone_android, Colors.green),
            _buildPaymentOption('Pay via Credit/Debit Card', Icons.credit_card, Colors.blue),
            _buildPaymentOption('Pay via Bank Transfer', Icons.account_balance, Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentHistory(List<dynamic> history) {
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
            for (var payment in history)
              ListTile(
                title: Text(payment['date']),
                subtitle: Text(payment['method']),
                trailing: Text('Ksh ${payment['amount']}'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.redAccent : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String title, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Redirect to respective payment page
      },
    );
  }
}
