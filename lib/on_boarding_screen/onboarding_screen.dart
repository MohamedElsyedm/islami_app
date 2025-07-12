import 'package:flutter/material.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/on_boarding_screen/dot_indicator.dart';
import 'package:islami_app/on_boarding_screen/onboarding_services.dart';
import 'package:islami_app/on_boarding_screen/page_item.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routName = '/onboarding screen';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/header.png',
              height: MediaQuery.sizeOf(context).height * 0.15,
              fit: BoxFit.fitWidth,
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: 5,
                itemBuilder: (_, index) {
                  return PageItem(index: index);
                },
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox like a null
                pageIndex == 0
                    ? SizedBox(width: 65)
                    : TextButton(
                        onPressed: () {
                          if (pageIndex >= 1) {
                            _controller.animateToPage(
                              pageIndex - 1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                            print(pageIndex);
                          }
                        },
                        child: Text('Back'),
                      ),
                Spacer(),
                DotIndicator(isActive: pageIndex == 0),
                DotIndicator(isActive: pageIndex == 1),
                DotIndicator(isActive: pageIndex == 2),
                DotIndicator(isActive: pageIndex == 3),
                DotIndicator(isActive: pageIndex == 4),
                Spacer(),
                TextButton(
                  onPressed: () {
                    if (pageIndex <= 3) {
                      _controller.animateToPage(
                        pageIndex + 1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                      print(pageIndex);
                    }
                    if (pageIndex == 4) {
                      Navigator.pushNamed(context, HomeScreen.routName);
                      OnboardingServices.onboardingComplete();
                    }
                  },
                  child: Text(pageIndex == 4 ? 'Start' : 'Next'),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
