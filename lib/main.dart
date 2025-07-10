import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/tabs/quran/sura_details_screen.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /// u can use this route list without using neither initialRoute nor home features
      /// by using "/" in rout name
      routes: {
        HomeScreen.routName: (_) => HomeScreen(),
        SuraDetailsScreen.routName: (_) => SuraDetailsScreen(),
      },
      initialRoute: HomeScreen.routName,
      theme: ThemeData.light(), //light mode
      darkTheme: AppTheme.darkTheme, //dark mode
      themeMode: ThemeMode.dark,
    );
  }
}
