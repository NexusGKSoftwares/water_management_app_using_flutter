import 'package:flutter/material.dart';

class BillListItem extends StatelessWidget {
  final String billName;
  final String billAmount;
  final String dueDate;
  final VoidCallback onPayPressed;

  const BillListItem({
    super.key,
    required this.billName,
    required this.billAmount,
    required this.dueDate,
    required this.onPayPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(billName),
        subtitle: Text('Amount: $billAmount\nDue Date: $dueDate'),
        trailing: ElevatedButton(
          onPressed: onPayPressed,
          child: const Text('Pay'),
        ),
      ),
    );
  }
}
