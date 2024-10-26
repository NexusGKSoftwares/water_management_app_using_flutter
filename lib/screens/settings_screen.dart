import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'change_password_screen.dart';
import 'link_accounts_screen.dart';
import 'privacy_screen.dart';
import 'theme_screen.dart';
import 'language_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSettingsSectionTitle('Account'),
          _buildSettingsTile(
            context,
            title: 'Update Profile',
            icon: Icons.person,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          _buildSettingsTile(
            context,
            title: 'Change Password',
            icon: Icons.lock,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
              );
            },
          ),
          _buildSettingsTile(
            context,
            title: 'Link Accounts',
            icon: Icons.link,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LinkAccountsScreen()),
              );
            },
          ),
          const SizedBox(height: 20),

          _buildSettingsSectionTitle('Notifications'),
          _buildSettingsTile(
            context,
            title: 'Push Notifications',
            icon: Icons.notifications_active,
            onTap: () {
              // Add a real page here if necessary
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Notifications turned")));
            },
          ),
          const SizedBox(height: 20),

          _buildSettingsSectionTitle('Privacy'),
          _buildSettingsTile(
            context,
            title: 'Privacy Settings',
            icon: Icons.privacy_tip,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPage()),
              );
            },
          ),
          const SizedBox(height: 20),

          _buildSettingsSectionTitle('Theme'),
          _buildSettingsTile(
            context,
            title: 'Dark Mode',
            icon: Icons.dark_mode,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThemeScreen()),
              );
            },
          ),
          const SizedBox(height: 20),

          _buildSettingsSectionTitle('Language'),
          _buildSettingsTile(
            context,
            title: 'Preferred Language',
            icon: Icons.language,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LanguageScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSettingsTile(BuildContext context, {required String title, required IconData icon, required Function() onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}
