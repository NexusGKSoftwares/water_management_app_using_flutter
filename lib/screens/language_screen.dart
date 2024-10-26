import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  // List of available languages
  final List<Map<String, String>> _languages = [
    {'code': 'en', 'name': 'English'},
    {'code': 'es', 'name': 'Spanish'},
    {'code': 'fr', 'name': 'French'},
    {'code': 'de', 'name': 'German'},
    {'code': 'zh', 'name': 'Chinese'},
  ];

  String _selectedLanguage = 'en'; // Default language code

  @override
  void initState() {
    super.initState();
    _loadPreferredLanguage(); // Load the preferred language when the screen initializes
  }

  // Load the preferred language from shared preferences
  void _loadPreferredLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = prefs.getString('preferred_language') ?? 'en'; // Default to English
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Settings'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Select your preferred language:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _languages.length,
                itemBuilder: (context, index) {
                  return _buildLanguageTile(
                    context,
                    _languages[index]['name']!,
                    _languages[index]['code']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Builds a tile for each language
  Widget _buildLanguageTile(BuildContext context, String languageName, String languageCode) {
    return ListTile(
      title: Text(languageName),
      trailing: _selectedLanguage == languageCode
          ? Icon(Icons.check, color: Colors.green)
          : null,
      onTap: () async {
        setState(() {
          _selectedLanguage = languageCode; // Update selected language
        });

        // Save the selected language in shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('preferred_language', languageCode);
      },
    );
  }
}
