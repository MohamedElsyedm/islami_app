import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/quran/quran_service.dart';
import 'package:islami_app/tabs/quran/sura.dart';
import 'package:islami_app/widgets/loading_indicator.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routName = '/sura_details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];

  late Sura sura;

  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as Sura;
    if (ayat.isEmpty) {
      loadSura();
    }
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
          Expanded(
            child: ayat.isEmpty
                ? LoadingIndicator()
                : ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    separatorBuilder: (_, _) => SizedBox(height: 12),
                    itemCount: ayat.length,
                    itemBuilder: (_, index) => Text(
                      ayat[index],
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: textTheme.titleLarge!.copyWith(
                        color: AppTheme.primary,
                      ),
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

  Future<void> loadSura() async {
    String suraFileContent = await QuranService.loadSuraFile(sura.num);
    ayat = suraFileContent.split('\n');
    print(ayat);
    setState(() {});
  }
}
