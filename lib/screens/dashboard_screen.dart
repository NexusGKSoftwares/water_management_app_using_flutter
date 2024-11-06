import 'package:flutter/material.dart';
import 'bill_payment_screen.dart';
import 'water_usage_screen.dart';
import 'fault_reporting_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart'; // Import your settings screen

class DashboardScreen extends StatelessWidget {
  final String userName;
  final String userEmail;

  const DashboardScreen({super.key, required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Add logout functionality here
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildBanner(),
              const SizedBox(height: 20),
              // Display user information at the top
              _buildUserInfo(),
              const SizedBox(height: 20),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: <Widget>[
                  _buildDashboardCard(context, 'Bill Payment', Icons.payment, Colors.orangeAccent, const BillPaymentScreen(), '', 'paymentHero'),
                  _buildDashboardCard(context, 'Water Usage', Icons.bar_chart, Colors.blue, WaterUsageScreen(), '', 'usageHero'),
                  _buildDashboardCard(context, 'Fault', Icons.report_problem, Colors.redAccent, const FaultReportingScreen(), '', 'faultHero'),
                  _buildDashboardCard(context, 'Notifications', Icons.notifications, Colors.green, NotificationsScreen(), '', 'notificationHero'),
                  _buildDashboardCard(context, 'Profile', Icons.person, Colors.purple, const ProfileScreen(), '', 'profileHero'),
                  _buildDashboardCard(context, 'Settings', Icons.settings, Colors.teal, const SettingsScreen(), '', 'settingsHero'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Card(
      color: Colors.blueAccent,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $userName',
              style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: $userEmail',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: const Stack(
        alignment: Alignment.topCenter,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Pure Drops Waters',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Manage your water supply efficiently',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            top: -40,
            child: CircleAvatar(
              radius: 40,
            ),
          ),
        ],
      ),
    );
  }

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
