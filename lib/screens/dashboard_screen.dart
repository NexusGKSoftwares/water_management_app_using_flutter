import 'package:flutter/material.dart';
import 'bill_payment_screen.dart';
import 'water_usage_screen.dart';
import 'fault_reporting_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart'; // Import your settings screen

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(  // Enable scrolling
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildBanner(),  // Add the banner here
              const SizedBox(height: 20),  // Space between banner and cards
              GridView(
                shrinkWrap: true,  // Allow grid to take only needed height
                physics: const NeverScrollableScrollPhysics(),  // Disable scrolling on the grid
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,  // Two cards per row
                  childAspectRatio: 4 / 3,  // Larger card size by adjusting aspect ratio
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: <Widget>[
                  _buildDashboardCard(context, 'Bill Payment', Icons.payment, Colors.orangeAccent, const BillPaymentScreen(), '', 'paymentHero'),
                  _buildDashboardCard(context, 'Water Usage', Icons.bar_chart, Colors.blue, WaterUsageScreen(), '', 'usageHero'),
                  _buildDashboardCard(context, 'Fault', Icons.report_problem, Colors.redAccent, const FaultReportingScreen(), '', 'faultHero'),
                  _buildDashboardCard(context, 'Notifications', Icons.notifications, Colors.green, NotificationsScreen(), '', 'notificationHero'),
                  _buildDashboardCard(context, 'Profile', Icons.person, Colors.purple, const ProfileScreen(), '', 'profileHero'),
                  _buildDashboardCard(context, 'Settings', Icons.settings, Colors.teal, const SettingsScreen(), '', 'settingsHero'), // Settings Card
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
// Function to create the banner with a logo
Widget _buildBanner() {
  return Container(
    height: 200,  // Height of the banner
    decoration: BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: const Stack(
      alignment: Alignment.topCenter,
      children: [
        // Banner content
        Center(  // Center the column within the banner
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Pure Drops Waters',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,  // Center the text
              ),
              SizedBox(height: 20),
              Text(
                'Manage your water supply efficiently',
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,  // Center the text
              ),
            ],
          ),
        ),
        // Logo at the top of the banner
        Positioned(
          top: -40,  // Adjust this value to position the logo
          child: CircleAvatar(
            radius: 40,  // Size of the logo
              // Your logo path
          ),
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
        footer: Container(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            footerText,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
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
                const SizedBox(height: 2),
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
