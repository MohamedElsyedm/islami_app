import 'package:flutter/material.dart';
import 'package:islami_app/tabs/quran/most_recently_item.dart';
import 'package:islami_app/tabs/quran/quran_service.dart';

class MostRecentlySection extends StatelessWidget {
  const MostRecentlySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: QuranService.mostREcentlySuras.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Most Recently',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.16,
              child: ListView.separated(
                // reverse: true, make list starts from end
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => MostRecentlyItem(
                  sura: QuranService.mostREcentlySuras.reversed.toList()[index],
                ),
                separatorBuilder: (_, _) => SizedBox(width: 10),
                itemCount: QuranService.mostREcentlySuras.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
