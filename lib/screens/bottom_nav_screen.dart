import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'water_usage_screen.dart';
import 'bill_payment_screen.dart';
import 'profile_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    DashboardScreen(),
    WaterUsageScreen(),
    BillPaymentScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pure Drops Water'),
        backgroundColor: Colors.blueAccent,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(height: 60.0, color: const Color.fromARGB(255, 0, 0, 240)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (index) {
              return GestureDetector(
                onTap: () => _onItemTapped(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getIconForIndex(index),
                      color: _selectedIndex == index
                          ? Colors.white
                          : Colors.white70,
                    ),
                    SizedBox(height: 4),
                    if (_selectedIndex == index) ...[
                      ClipPath(
                        clipper: HalfCircleClipper(),
                        child: Container(
                          width: 50,
                          height: 25,
                          color: Colors.blue[
                              700], // Slightly darker shade for the effect
                        ),
                      ),
                    ],
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.water;
      case 2:
        return Icons.payment;
      case 3:
        return Icons.person;
      default:
        return Icons.home; // Default icon
    }
  }
}

// Custom clipper for the half-circle effect above the selected icon
class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2, 0, // Control point for the curve
      size.width, size.height,
    );
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
