import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSettingsItem(
              context,
              title: 'Account Settings',
              icon: Icons.account_circle,
              onTap: () {
                // Navigate to Account Settings Page
              },
            ),
            _buildSettingsItem(
              context,
              title: 'Notification Preferences',
              icon: Icons.notifications,
              onTap: () {
                // Navigate to Notification Settings Page
              },
            ),
            _buildSettingsItem(
              context,
              title: 'Privacy Settings',
              icon: Icons.privacy_tip,
              onTap: () {
                // Navigate to Privacy Settings Page
              },
            ),
            _buildSettingsItem(
              context,
              title: 'Help & Support',
              icon: Icons.help,
              onTap: () {
                // Navigate to Help Page
              },
            ),
            _buildSettingsItem(
              context,
              title: 'About App',
              icon: Icons.info,
              onTap: () {
                // Navigate to About Page
              },
            ),
            _buildSettingsItem(
              context,
              title: 'Log Out',
              icon: Icons.logout,
              onTap: () {
                // Log out logic
              },
              color: Colors.red, // Red for log out to stand out
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(icon, color: color ?? Colors.blueAccent),
      title: Text(title, style: TextStyle(fontSize: 18)),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
