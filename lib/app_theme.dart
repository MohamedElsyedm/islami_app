import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFE2BE7F);
  static const Color black = Color(0xFF202020);
  static const Color white = Color(0xFFFFFFFF);

  static ThemeData lightTheme = ThemeData.light();
  static ThemeData darkTheme = ThemeData(
    primaryColor: primary,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary,

      ///if num of items 3 or less the default type is .fixed
      ///  else if more than 3 the default type is shifting
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,

      ///label color
      selectedItemColor: white,
    ),
  );
}
