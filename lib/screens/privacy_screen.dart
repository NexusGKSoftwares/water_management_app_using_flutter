import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Settings'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Manage your privacy settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            _buildPrivacySetting(
              context,
              title: 'Data Sharing',
              description: 'Control how your data is shared with third parties.',
              icon: Icons.share,
              onTap: () {
                // Handle tap
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Sharing settings opened')));
              },
            ),
            _buildPrivacySetting(
              context,
              title: 'Account Security',
              description: 'Manage your account security and recovery options.',
              icon: Icons.security,
              onTap: () {
                // Handle tap
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account Security settings opened')));
              },
            ),
            _buildPrivacySetting(
              context,
              title: 'Ad Personalization',
              description: 'Control how ads are personalized for you.',
              icon: Icons.ad_units,
              onTap: () {
                // Handle tap
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ad Personalization settings opened')));
              },
            ),
            _buildPrivacySetting(
              context,
              title: 'Push Notifications',
              description: 'Manage your push notification preferences.',
              icon: Icons.notifications,
              onTap: () {
                // Handle tap
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Push Notifications settings opened')));
              },
            ),
            _buildPrivacySetting(
              context,
              title: 'Data Retention',
              description: 'Review how long we keep your data.',
              icon: Icons.access_time,
              onTap: () {
                // Handle tap
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Retention settings opened')));
              },
            ),
            _buildPrivacySetting(
              context,
              title: 'Clear Data',
              description: 'Remove all stored data from the app.',
              icon: Icons.delete_forever,
              onTap: () {
                // Handle tap
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data cleared successfully')));
              },
            ),
            SizedBox(height: 30),
            Text(
              'Your privacy is important to us. Please review these settings regularly.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacySetting(BuildContext context, {required String title, required String description, required IconData icon, required Function() onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent, size: 30),
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
