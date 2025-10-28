import 'package:flutter/material.dart';
import 'package:islami_app/api/api_manager.dart';

class MenuItem {
  const MenuItem({
    required this.city,
    required this.country,
    required this.icon,
  });

  final String city;
  final String country;
  final IconData icon;
}

class MenuItems {
  static const List<MenuItem> firstItems = [cairo, dubai];
  static const List<MenuItem> secondItems = [cancel];

  static const cairo = MenuItem(
    city: 'cairo',
    country: 'egypt',
    icon: Icons.location_on_rounded,
  );
  static const dubai = MenuItem(
    city: 'dubai',
    country: 'united arab emirates',
    icon: Icons.location_on_rounded,
  );
  static const cancel = MenuItem(
    city: 'Cancel',
    country: 'Cancel',
    icon: Icons.cancel,
  );

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 22),
        const SizedBox(width: 10),
        Expanded(
          child: Text(item.city, style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.cairo:
        ApiManager.city = item.city;
        ApiManager.country = item.country;
        break;
      case MenuItems.dubai:
        ApiManager.city = item.city;
        ApiManager.country = item.country;
        break;
      case MenuItems.cancel:
        break;
    }
  }
}
