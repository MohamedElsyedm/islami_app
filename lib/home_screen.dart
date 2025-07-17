import 'package:flutter/material.dart';
import 'package:islami_app/nav_bar_selected_icon.dart';
import 'package:islami_app/nav_bar_unselected_icon.dart';
import 'package:islami_app/tabs/hadith/hadith_tab.dart';
import 'package:islami_app/tabs/quran/quran_tab.dart';
import 'package:islami_app/tabs/radio/radio_tab.dart';
import 'package:islami_app/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = '/RoutName Screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //u should not put it at build widget & this is the right place
  // because when make setState it rebuild build widget and rebuild
  // selectedIndex too to be 0
  // ,so it will not be changed forever
  int selectedIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  List<String> imageBackground = [
    'quran_background',
    'hadith_background',
    'sebha_background',
    'radio_background',
    'time_background',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          if (selectedIndex == index) return;
          selectedIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imageName: 'quran'),
            activeIcon: NavBarSelectedIcon(imageName: 'quran'),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imageName: 'hadith'),
            activeIcon: NavBarSelectedIcon(imageName: 'hadith'),
            label: 'Hadith',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imageName: 'sebha'),
            activeIcon: NavBarSelectedIcon(imageName: 'sebha'),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imageName: 'radio'),
            activeIcon: NavBarSelectedIcon(imageName: 'radio'),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imageName: 'time'),
            activeIcon: NavBarSelectedIcon(imageName: 'time'),
            label: 'Time',
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/${imageBackground[selectedIndex]}.png',
            ),
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/header.png',
              height: MediaQuery.sizeOf(context).height * 0.15,
              fit: BoxFit.fitWidth,
            ),
            Expanded(child: tabs[selectedIndex]),
          ],
        ),
      ),
    );
  }
}
