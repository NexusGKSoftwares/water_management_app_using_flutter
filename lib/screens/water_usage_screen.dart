import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts; // Add charts_flutter package for data visualization

class WaterUsageScreen extends StatelessWidget {
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
          children: [
            // Water Usage Summary
            _buildUsageSummary(),
            SizedBox(height: 20),
            // Water Usage Chart
            Expanded(child: _buildUsageChart()),
          ],
        ),
      ),
    );
  }

  // Widget to display the usage summary
  Widget _buildUsageSummary() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Water Usage Summary',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('Total Usage: 1500 Liters', style: TextStyle(fontSize: 16)),
          Text('Average Daily Usage: 50 Liters', style: TextStyle(fontSize: 16)),
          Text('Usage This Month: 1200 Liters', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  // Widget to build the water usage chart
  Widget _buildUsageChart() {
    List<charts.Series<WaterUsageData, String>> series = [
      charts.Series(
        id: 'Water Usage',
        data: _getWaterUsageData(),
        domainFn: (WaterUsageData usage, _) => usage.day,
        measureFn: (WaterUsageData usage, _) => usage.liters,
        colorFn: (WaterUsageData usage, _) => charts.MaterialPalette.blue.shadeDefault,
      ),
    ];

    return charts.BarChart(
      series,
      animate: true,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      vertical: true,
      behaviors: [charts.SeriesLegend()],
    );
  }

  // Sample data for the water usage chart
  List<WaterUsageData> _getWaterUsageData() {
    return [
      WaterUsageData('Mon', 30),
      WaterUsageData('Tue', 50),
      WaterUsageData('Wed', 40),
      WaterUsageData('Thu', 60),
      WaterUsageData('Fri', 70),
      WaterUsageData('Sat', 80),
      WaterUsageData('Sun', 90),
    ];
  }
}

// Data class for water usage
class WaterUsageData {
  final String day;
  final int liters;

  WaterUsageData(this.day, this.liters);
}
