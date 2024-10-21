import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center align vertically
        crossAxisAlignment: CrossAxisAlignment.center, // Center align horizontally
        children: [
          // Profile Photo
          CircleAvatar(
            radius: 50, // Size of the profile photo
            backgroundImage: NetworkImage('https://example.com/profile_photo.png'), // Replace with the actual image URL
          ),
          const SizedBox(height: 20),

          // User Information
          const Text(
            'Name: John Doe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center, // Center align the text
          ),
          const SizedBox(height: 10),
          const Text(
            'Email: johndoe@example.com',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center, // Center align the text
          ),
          const SizedBox(height: 10),
          const Text(
            'Phone: +254 700 000 000',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center, // Center align the text
          ),
          const SizedBox(height: 20),

          // Edit Button
          ElevatedButton(
            onPressed: () {
              // Add functionality to edit profile
            },
            child: const Text('Edit Profile'),
          ),
        ],
      ),
    );
  }
}
