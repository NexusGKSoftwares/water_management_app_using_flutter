import 'package:flutter/material.dart';
import 'screens/bottom_nav_screen.dart';
import 'screens/register_screen.dart';

void main() {
  runApp(const WaterManagementApp());
}

class WaterManagementApp extends StatelessWidget {
  const WaterManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const BottomNavScreen(),
      routes: {
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
