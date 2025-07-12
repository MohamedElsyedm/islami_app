import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/on_boarding_screen/onboarding.dart';
import 'package:islami_app/on_boarding_screen/onboarding_services.dart';

class PageItem extends StatelessWidget {
  final int index;
  const PageItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<OnBoarding> itemsList = OnboardingServices.onboardingList;
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Image.asset(
            itemsList[index].image,
            width: screenSize.width,
            height: screenSize.height * 0.4,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.06),
            child: Text(
              itemsList[index].title,
              style: textTheme.headlineSmall!.copyWith(color: AppTheme.primary),
            ),
          ),
          Text(
            itemsList[index].description,
            textAlign: TextAlign.center,
            style: textTheme.titleLarge!.copyWith(color: AppTheme.primary),
          ),
        ],
      ),
    );
  }
}
