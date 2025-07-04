import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarUnselectedIcon extends StatelessWidget {
  final String imageName;
  const NavBarUnselectedIcon({required this.imageName, super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$imageName.svg',
      height: 28,
      width: 28,
      fit: BoxFit.fill,
    );
  }
}
