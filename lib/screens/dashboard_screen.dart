import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Profile Overview
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage('https://example.com/profile.jpg'),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('John Doe', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text('Account No: 123456', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Water Bill Summary
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Current Bill: KSh 2,500', style: TextStyle(fontSize: 18)),
                      Text('Due Date: 25th Oct 2024', style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to payment screen
                        },
                        child: Text('Pay Now'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Usage Monitoring (Placeholder for Chart)
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Water Usage Over Time', style: TextStyle(fontSize: 18)),
                      // Placeholder for chart widget
                      SizedBox(
                        height: 200,
                        child: charts.BarChart(
                          [
                            charts.Series(
                              id: 'Water Usage',
                              domainFn: (dynamic usage, _) => usage['month'],
                              measureFn: (dynamic usage, _) => usage['amount'],
                              data: [
                                {'month': 'Jan', 'amount': 300},
                                {'month': 'Feb', 'amount': 400},
                                {'month': 'Mar', 'amount': 350},
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Quick Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to report fault screen
                    },
                    child: Text('Report Fault'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to support screen
                    },
                    child: Text('Contact Support'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
