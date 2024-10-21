import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  final int notificationCount;

  const NotificationIcon({
    Key? key,
    required this.notificationCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Icon(Icons.notifications, size: 30),
        if (notificationCount > 0)
          Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$notificationCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
