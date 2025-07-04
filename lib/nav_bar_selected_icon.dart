import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/app_theme.dart';

class NavBarSelectedIcon extends StatelessWidget {
  final String imageName;
  const NavBarSelectedIcon({required this.imageName, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: AppTheme.black.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(66),
      ),
      child: SvgPicture.asset(
        'assets/icons/$imageName.svg',
        height: 22,
        width: 22,
        fit: BoxFit.fill,
        colorFilter: const ColorFilter.mode(AppTheme.white, BlendMode.srcIn),
      ),
    );
  }
}
