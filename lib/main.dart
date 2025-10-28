import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/on_boarding_screen/onboarding_screen.dart';
import 'package:islami_app/tabs/hadith/hadith_details_screen.dart';
import 'package:islami_app/tabs/quran/quran_service.dart';
import 'package:islami_app/tabs/quran/sura_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await QuranService.getMostRecently();
  bool onboardingComplete = prefs.getBool('onboarding_complete') ?? false;

  runApp(IslamiApp(onboardingComplete: onboardingComplete));
}

class IslamiApp extends StatelessWidget {
  final bool onboardingComplete;
  const IslamiApp({super.key, required this.onboardingComplete});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /// u can use this route list without using neither initialRoute nor home features
      /// by using "/" in rout name
      routes: {
        HomeScreen.routName: (_) => HomeScreen(),
        SuraDetailsScreen.routName: (_) => SuraDetailsScreen(),
        OnboardingScreen.routName: (_) => OnboardingScreen(),
        HadithDetailsScreen.routName: (_) => HadithDetailsScreen(),
      },
      initialRoute: onboardingComplete
          ? HomeScreen.routName
          : OnboardingScreen.routName,
      theme: ThemeData.light(), //light mode
      darkTheme: AppTheme.darkTheme, //dark mode
      themeMode: ThemeMode.dark,
    );
  }
}
