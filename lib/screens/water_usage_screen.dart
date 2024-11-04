import 'package:flutter/material.dart';

class WaterUsageScreen extends StatelessWidget {
  // Sample data for daily water usage in liters
  final List<int> usageData = [70, 65, 50, 90, 40, 80, 75];


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Usage'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Water Consumption Goal section
            const Text(
              'Water Consumption Goal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Goal: 150 Liters per Day',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 120 / 150, // Example progress (120 Liters used out of 150)
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                  const SizedBox(height: 4),
                  const Text('120 Liters Used Today'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Recent Water Usage History
            const Text(
              'Recent Water Usage (Last 7 Days)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: usageData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.calendar_today, color: Colors.blue),
                      title: Text('Day ${index + 1}'),
                      subtitle: Text('${usageData[index]} Liters used'),
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

void main() {
  runApp(MaterialApp(
    home: WaterUsageScreen(),
  ));
}
