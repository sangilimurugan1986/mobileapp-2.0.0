import 'package:flutter/cupertino.dart';

class Menu {
  Menu({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.route,
  });

  String label;
  IconData icon;
  IconData activeIcon;
  String route;
}
