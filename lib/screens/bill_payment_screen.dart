import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BillPaymentScreen extends StatefulWidget {
  const BillPaymentScreen({super.key});

  @override
  _BillPaymentScreenState createState() => _BillPaymentScreenState();
}

class _BillPaymentScreenState extends State<BillPaymentScreen> {
  final _userIdController = TextEditingController();
  final _previousReadingController = TextEditingController();
  final _currentReadingController = TextEditingController();
  final _readingDateController = TextEditingController();

  bool _isLoading = false;
  String _message = '';
  double _billAmount = 0.0;
  int _unitsConsumed = 0;
  int _previousReading = 0;
  int _currentReading = 0;

  // Submit reading and fetch bill details from the backend
  Future<void> _submitReading() async {
    setState(() {
      _isLoading = true;
      _message = '';
    });

    final String userId = _userIdController.text;
    final String previousReading = _previousReadingController.text;
    final String currentReading = _currentReadingController.text;
    final String readingDate = _readingDateController.text;

    // Validate inputs
    if (userId.isEmpty || previousReading.isEmpty || currentReading.isEmpty || readingDate.isEmpty) {
      setState(() {
        _isLoading = false;
        _message = 'Please fill in all fields.';
      });
      return;
    }

    // Create the request payload
    final Map<String, String> body = {
      'userId': userId,
      'previous_reading': previousReading,
      'current_reading': currentReading,
      'reading_date': readingDate,
    };

    // Send data to backend
    final Uri url = Uri.parse('http://localhost/pure/generate_bill.php');
    final response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (responseData['success']) {
        setState(() {
          _isLoading = false;
          _message = responseData['message'] ?? 'Bill generated successfully.';
          _billAmount = responseData['billAmount'];
          _unitsConsumed = responseData['unitsConsumed'];
          _previousReading = responseData['previousReading'];
          _currentReading = responseData['currentReading'];
        });
      } else {
        setState(() {
          _isLoading = false;
          _message = responseData['message'] ?? 'Error generating the bill.';
        });
      }
    } else {
      setState(() {
        _isLoading = false;
        _message = 'Failed to connect to the server.';
      });
    }
  }

  // Build reusable TextField widget
  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

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
            const Text(
              'Enter Meter Reading Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildTextField('User ID', _userIdController),
            _buildTextField('Previous Reading', _previousReadingController),
            _buildTextField('Current Reading', _currentReadingController),
            _buildTextField('Reading Date (YYYY-MM-DD)', _readingDateController),
            const SizedBox(height: 20),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: _submitReading,
                    child: const Text('Submit Reading'),
                    style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                  ),
            const SizedBox(height: 20),
            if (_message.isNotEmpty)
              Text(
                _message,
                style: TextStyle(
                  color: _message == 'Please fill in all fields.' ? Colors.red : Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 20),
            if (_billAmount > 0)
              Column(
                children: [
                  const Text(
                    'Bill Summary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text('Previous Reading: $_previousReading'),
                  Text('Current Reading: $_currentReading'),
                  Text('Units Consumed: $_unitsConsumed'),
                  Text('Total Bill Amount: \$$_billAmount'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add your payment gateway or payment logic here
                    },
                    child: const Text('Pay Bill'),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
