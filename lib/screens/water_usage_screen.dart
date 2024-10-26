import 'package:flutter/material.dart';

class WaterUsageScreen extends StatelessWidget {
  // Sample data for daily water usage in liters
  final List<int> usageData = [70, 65, 50, 90, 40, 80, 75]; // Example data for a week

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water Usage'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Water Consumption Goal section
            Text(
              'Water Consumption Goal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Goal: 150 Liters per Day',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 120 / 150, // Example progress (120 Liters used out of 150)
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                  SizedBox(height: 4),
                  Text('120 Liters Used Today'),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Recent Water Usage History
            Text(
              'Recent Water Usage (Last 7 Days)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: usageData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.calendar_today, color: Colors.blue),
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
