import 'dart:math';

import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _currentRotationAngle = 0.0; // store the current angle
  final double _angleIncrement = pi / 15; // rotation each click

  List<String> sebhaStatements = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'استغفر الله',
    'لا إله إلا الله',
  ];
  int indexList = 0;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 100, // Speed of each incremental rotation
      ),
      vsync:
          this, //'this' refers to the State object, which is a TickerProvider
      // this line shows how to animate the rotation
    );

    // The animation will always go from 0 to _angleIncrement
    // This represents the *change* in angle for each click
    _animation = Tween<double>(begin: 0.0, end: _angleIncrement).animate(_controller)
      ..addListener(() {
        setState(() {
          // Trigger a rebuild to apply the current animation value
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // When the animation completes, update the total accumulated angle
          _currentRotationAngle += _angleIncrement;
          // Important: Reset the controller so it's ready to animate the next increment
          _controller.reset();
        }
      });
  }

  void onTap() {
    if (counter % 33 == 0 && counter != 0) {
      print(counter);
      if (indexList > sebhaStatements.length) {
        indexList = 0;
      } else {
        indexList++;
      }
      print(indexList);
    }
    counter++;

    // Only start the animation if it's not already running
    //start the animation when click, one by one
    if (!_controller.isAnimating) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 15),
            child: Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
              style: textTheme.headlineLarge,
            ),
          ),
          Image.asset(
            'assets/images/sebha_head.png',
            height: screenHeight * 0.1,
            fit: BoxFit.fill,
          ),
          InkWell(
            onTap: () => onTap(),
            splashColor: Colors.transparent, // Removes the ripple effect
            highlightColor: Colors
                .transparent, // Removes the solid highlight color when held down

            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: _currentRotationAngle + _animation.value,
                  child: Image.asset(
                    'assets/images/sebha_body_circle.png',
                    height: screenHeight * 0.4,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sebhaStatements[indexList],
                      style: textTheme.headlineLarge,
                    ),
                    Text('$counter', style: textTheme.headlineLarge),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
