import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample user data
    final String userName = "John Doe";
    final String phoneNumber = "+123 456 7890";
    final String email = "john.doe@example.com";
    final String address = "123 Water St, City, Country with a longer address example";

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView( // Enable scrolling
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture Section
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150'), // Placeholder image
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        // Add functionality to change profile picture
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.redAccent,
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // User Information Section
            Text(
              'User Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildInfoRow('Name', userName),
                    _buildInfoRow('Phone Number', phoneNumber),
                    _buildInfoRow('Email', email),
                    _buildInfoRow('Address', address),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Settings and Logout Section
            Text(
              'Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Change Password'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Add functionality for changing password
                      },
                    ),
                    ListTile(
                      title: Text('Privacy Settings'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Add functionality for privacy settings
                      },
                    ),
                    ListTile(
                      title: Text('Help & Support'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Add functionality for help and support
                      },
                    ),
                    ListTile(
                      title: Text('Logout'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Add functionality for logout
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
