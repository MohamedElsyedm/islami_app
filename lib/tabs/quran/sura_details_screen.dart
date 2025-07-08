import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/quran/sura.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routName = '/sura_details_screen';
  @override
  Widget build(BuildContext context) {
    Sura sura = ModalRoute.of(context)!.settings.arguments as Sura;
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(title: Text(sura.englishName)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/details_header_left.png',
                  height: screenHeight * 0.1,
                  fit: BoxFit.fill,
                ),
                Text(
                  sura.arabicName,
                  style: textTheme.headlineSmall!.copyWith(
                    color: AppTheme.primary,
                  ),
                ),
                Image.asset(
                  'assets/images/details_header_right.png',
                  height: screenHeight * 0.1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),

          Spacer(),
          Image.asset(
            'assets/images/details_footer.png',
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
