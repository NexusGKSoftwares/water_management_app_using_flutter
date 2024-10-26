import 'package:flutter/material.dart';
import 'bill_payment_screen.dart';
import 'water_usage_screen.dart';
import 'fault_reporting_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart'; // Import your settings screen

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(  // Wrap the body in a SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Banner Section
            _buildBanner(),
            SizedBox(height: 16), // Space between banner and cards
            GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two cards per row
                childAspectRatio: 4 / 3, // Larger card size by adjusting aspect ratio
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              shrinkWrap: true, // Allow the grid to take only the space it needs
              physics: NeverScrollableScrollPhysics(), // Disable the grid's own scrolling
              children: <Widget>[
                _buildDashboardCard(context, 'Bill Payment', Icons.payment, Colors.orangeAccent, BillPaymentScreen(), '', 'paymentHero'),
                _buildDashboardCard(context, 'Water Usage', Icons.bar_chart, Colors.blue, WaterUsageScreen(), '', 'usageHero'),
                _buildDashboardCard(context, 'Fault', Icons.report_problem, Colors.redAccent, FaultReportingScreen(), '', 'faultHero'),
                _buildDashboardCard(context, 'Notifications', Icons.notifications, Colors.green, NotificationsScreen(), '', 'notificationHero'),
                _buildDashboardCard(context, 'Profile', Icons.person, Colors.purple, ProfileScreen(), '', 'profileHero'),
                _buildDashboardCard(context, 'Settings', Icons.settings, Colors.teal, SettingsScreen(), '', 'settingsHero'), // Settings Card
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to build the banner
  Widget _buildBanner() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            'Welcome to Your Water Management App!',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Manage your water services efficiently and effectively.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
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
