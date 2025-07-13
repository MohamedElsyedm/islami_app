import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/hadith/hadith.dart';
import 'package:islami_app/tabs/hadith/hadith_details_screen.dart';
import 'package:islami_app/widgets/loading_indicator.dart';

class HadithItem extends StatefulWidget {
  final int index;
  const HadithItem({super.key, required this.index});

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  Hadith? hadith;

  @override
  Widget build(BuildContext context) {
    //check be if the function contains setstate in build function
    if (hadith == null) {
      loadHadith();
    }

    double screenHeight = MediaQuery.sizeOf(context).height;
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(HadithDetailsScreen.routName, arguments: hadith);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/hadith_header_left.png',
                    height: screenHeight * 0.08,
                    fit: BoxFit.fill,
                  ),
                  if (hadith != null)
                    Expanded(
                      child: Text(
                        hadith!.title,
                        style: textTheme.titleLarge!.copyWith(
                          color: AppTheme.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  Image.asset(
                    'assets/images/hadith_header_right.png',
                    height: screenHeight * 0.08,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/hadith_card_background.png',
                    ),
                  ),
                ),
                child: hadith == null
                    ? LoadingIndicator(color: AppTheme.black)
                    : ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) => Text(
                          hadith!.content[index],
                          textAlign: TextAlign.center,
                          style: textTheme.titleMedium!.copyWith(
                            color: AppTheme.black,
                          ),
                        ),
                        separatorBuilder: (_, _) => SizedBox(height: 4),
                        itemCount: hadith!.content.length,
                      ),
              ),
            ),
            Image.asset(
              'assets/images/hadith_footer.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadHadith() async {
    String hadithFileContent = await rootBundle.loadString(
      'assets/text/h${widget.index + 1}.txt',
    );
    List<String> hadithLines = hadithFileContent.split('\n');
    String title = hadithLines[0];
    hadithLines.removeAt(0);
    List<String> content = hadithLines;
    hadith = Hadith(title: title, content: content, num: widget.index + 1);
    setState(() {});
  }
}
