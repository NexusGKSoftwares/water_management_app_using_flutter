import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'Change Password Page Content',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
