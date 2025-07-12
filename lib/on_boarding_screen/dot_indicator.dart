import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;
  const DotIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.all(7),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isActive ? AppTheme.primary : Colors.grey,
      ),
      width: isActive ? 18 : 7,
      height: 7,
    );
  }
}
