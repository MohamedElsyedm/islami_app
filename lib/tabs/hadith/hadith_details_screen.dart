import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/hadith/hadith.dart';

class HadithDetailsScreen extends StatelessWidget {
  static const String routName = '/hadith_details_screen';

  @override
  Widget build(BuildContext context) {
    Hadith hadith = ModalRoute.of(context)!.settings.arguments as Hadith;

    TextTheme textTheme = Theme.of(context).textTheme;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(title: Text('Hadith ${hadith.num}')),
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
                Expanded(
                  child: Text(
                    hadith.title,
                    style: textTheme.headlineSmall!.copyWith(
                      color: AppTheme.primary,
                    ),
                    textAlign: TextAlign.center,
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
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              separatorBuilder: (_, _) => SizedBox(height: 12),
              itemCount: hadith.content.length,
              itemBuilder: (_, index) => Text(
                hadith.content[index],
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: textTheme.titleLarge!.copyWith(color: AppTheme.primary),
              ),
            ),
          ),
          Image.asset(
            'assets/images/details_footer.png',
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
