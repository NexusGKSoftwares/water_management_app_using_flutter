import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import FontAwesome

class LinkAccountsScreen extends StatelessWidget {
  const LinkAccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Link Accounts'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Link your social media accounts to enhance your experience.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            _buildAccountTile(
              context,
              icon: FontAwesomeIcons.facebook, // FontAwesome Facebook Icon
              platform: 'Facebook',
              color: Colors.blue,
              isLinked: false,
              onTapLink: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Facebook account linked')));
              },
              onTapUnlink: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Facebook account unlinked')));
              },
            ),
            _buildAccountTile(
              context,
              icon: FontAwesomeIcons.google, // FontAwesome Google Icon
              platform: 'Google',
              color: Colors.red,
              isLinked: true,
              onTapLink: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Google account linked')));
              },
              onTapUnlink: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Google account unlinked')));
              },
            ),
            _buildAccountTile(
              context,
              icon: FontAwesomeIcons.twitter, // FontAwesome Twitter Icon
              platform: 'Twitter',
              color: Colors.lightBlue,
              isLinked: false,
              onTapLink: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Twitter account linked')));
              },
              onTapUnlink: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Twitter account unlinked')));
              },
            ),
            _buildAccountTile(
              context,
              icon: FontAwesomeIcons.apple, // FontAwesome Apple Icon
              platform: 'Apple',
              color: Colors.black,
              isLinked: false,
              onTapLink: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Apple account linked')));
              },
              onTapUnlink: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Apple account unlinked')));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountTile(BuildContext context, {required IconData icon, required String platform, required Color color, required bool isLinked, required Function() onTapLink, required Function() onTapUnlink}) {
    return ListTile(
      leading: Icon(icon, color: color, size: 30),
      title: Text(
        platform,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text(isLinked ? 'Linked' : 'Not Linked', style: TextStyle(color: isLinked ? Colors.green : Colors.red)),
      trailing: ElevatedButton(
        onPressed: isLinked ? onTapUnlink : onTapLink,
        style: ElevatedButton.styleFrom(
          backgroundColor: isLinked ? Colors.redAccent : Colors.green, // Unlink = Red, Link = Green
        ),
        child: Text(isLinked ? 'Unlink' : 'Link'),
      ),
    );
  }
}
