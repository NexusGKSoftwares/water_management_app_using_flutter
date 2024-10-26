import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeScreen extends StatefulWidget {
  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  bool _isDarkMode = false; // Default theme is light mode

  @override
  void initState() {
    super.initState();
    _loadThemePreference(); // Load the theme preference when the screen initializes
  }

  // Load the preferred theme from shared preferences
  void _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false; // Default to light mode
    });
  }

  // Toggle the theme mode
  void _toggleTheme(bool? value) async {
    setState(() {
      _isDarkMode = value ?? false; // Update the theme state
    });

    // Save the selected theme in shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Settings'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Select your preferred theme:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SwitchListTile(
              title: Text('Dark Mode'),
              value: _isDarkMode,
              onChanged: _toggleTheme,
              secondary: Icon(_isDarkMode ? Icons.dark_mode : Icons.light_mode),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Apply the selected theme immediately
                if (_isDarkMode) {
                  // Apply dark theme
                  ThemeData.dark();
                } else {
                  // Apply light theme
                  ThemeData.light();
                }
                // Optionally pop the screen after saving
                Navigator.pop(context);
              },
              child: Text('Apply Theme'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Customize button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
