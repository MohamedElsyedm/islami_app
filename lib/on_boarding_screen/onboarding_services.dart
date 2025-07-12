import 'package:islami_app/on_boarding_screen/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingServices {
  static const List<String> onboardingImage = [
    'assets/images/on_boarding_image_1.png',
    'assets/images/on_boarding_image_2.png',
    'assets/images/on_boarding_image_3.png',
    'assets/images/on_boarding_image_4.png',
    'assets/images/on_boarding_image_5.png',
  ];

  static const List<String> onboardingTitle = [
    'Welcome To Islami App',
    'Welcome To Islami',
    'Reading the Quran',
    'Bearish',
    'Holy Quran Radio',
  ];

  static const List<String> onboardingDesc = [
    '',
    'We Are Very Excited To Have You In Our Community',
    'Read, and your Lord is the Most Generous',
    'Praise the name of your Lord, the Most High',
    'You can listen to the Holy Quran Radio through the application for free and easily',
  ];

  static List<OnBoarding> onboardingList = List.generate(
    5,
    (index) => itemGenerate(index),
  );

  static OnBoarding itemGenerate(int index) {
    return OnBoarding(
      image: onboardingImage[index],
      title: onboardingTitle[index],
      description: onboardingDesc[index],
    );
  }

  static void onboardingComplete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboarding_complete', true);
  }
}
