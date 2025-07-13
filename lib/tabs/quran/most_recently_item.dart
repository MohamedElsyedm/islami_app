import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/quran/sura.dart';
import 'package:islami_app/tabs/quran/sura_details_screen.dart';

class MostRecentlyItem extends StatelessWidget {
  final Sura sura;
  const MostRecentlyItem({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);

    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(SuraDetailsScreen.routName, arguments: sura);
      },
      child: Container(
        height: double.infinity,
        width: screenSize.width * 0.75,
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  sura.englishName,
                  style: textTheme.headlineSmall!.copyWith(
                    color: AppTheme.black,
                    fontSize: 20,
                  ),
                ),
                Text(
                  sura.arabicName,
                  style: textTheme.headlineSmall!.copyWith(
                    color: AppTheme.black,
                  ),
                ),
                Text(
                  '${sura.ayatCount} Verses',
                  style: textTheme.titleSmall!.copyWith(color: AppTheme.black),
                ),
              ],
            ),
            Image.asset(
              'assets/images/recent_sura.png',
              width: screenSize.width * 0.3,
              height: screenSize.height * 0.14,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
