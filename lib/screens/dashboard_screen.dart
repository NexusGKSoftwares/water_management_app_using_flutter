import 'package:flutter/material.dart';
import 'bill_payment_screen.dart';
import 'water_usage_screen.dart';
import 'fault_reporting_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';  // Import your settings screen

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,  // Two cards per row
                  childAspectRatio: 4 / 3,  // Larger card size by adjusting aspect ratio
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: <Widget>[
                  _buildDashboardCard(context, 'Bill Payment', Icons.payment, Colors.orangeAccent, BillPaymentScreen(), '', 'paymentHero'),
                  _buildDashboardCard(context, 'Water Usage', Icons.bar_chart, Colors.blue, WaterUsageScreen(), '', 'usageHero'),
                  _buildDashboardCard(context, 'Fault', Icons.report_problem, Colors.redAccent, FaultReportingScreen(), '', 'faultHero'),
                  _buildDashboardCard(context, 'Notifications', Icons.notifications, Colors.green, NotificationsScreen(), '', 'notificationHero'),
                  _buildDashboardCard(context, 'Profile', Icons.person, Colors.purple, ProfileScreen(), '', 'profileHero'),
                  _buildDashboardCard(context, 'Settings', Icons.settings, Colors.teal, SettingsScreen(), '', 'settingsHero'), // Settings Card
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Generalized card builder for all sections, similar to the profile card
  Widget _buildDashboardCard(BuildContext context, String title, IconData icon, Color color, Widget targetScreen, String footerText, String heroTag) {
    return Hero(
      tag: heroTag,
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => targetScreen),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 50, color: Colors.white),
                SizedBox(height: 2),
                Text(
                  title,
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        footer: Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            footerText,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
