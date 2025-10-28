import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/api/api_manager.dart';
import 'package:islami_app/api/date_utils.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/models/prayer_response_model/prayer_response_model.dart';
import 'package:islami_app/time/card_item.dart';
import 'package:islami_app/time/count_down_timer.dart';
import 'package:islami_app/time/select_location_with_drop_down_button.dart';
import 'package:just_audio/just_audio.dart';

class TimeCard extends StatefulWidget {
  const TimeCard({super.key});

  @override
  State<TimeCard> createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
  final AudioPlayer audioPlayer = AudioPlayer();

  void playAdhan() {
    audioPlayer.setUrl("https://cdn.aladhan.com/audio/adhans/a4.mp3");
    audioPlayer.play();
  }

  void stopAdhan() {
    audioPlayer.setUrl("https://cdn.aladhan.com/audio/adhans/a4.mp3");
    audioPlayer.stop();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;

    return FutureBuilder(
      future: ApiManager.getPrayerData(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: AppTheme.primary),
          );
        } else if (asyncSnapshot.hasError) {
          return Column(
            children: [
              Text('Something went wrong\n${asyncSnapshot.data!.status}'),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ApiManager.getPrayerData();
                  });
                },
                child: Text('Retry'),
              ),
            ],
          );
        } else if (asyncSnapshot.hasData) {
          PrayerResponseModel data = asyncSnapshot.data!;
          Map<String, dynamic> prayerTimes = PrayerTime.sortPrayerTimes(
            data.data.timings!.toJson(),
          );
          Map<String, Duration> prayerCountDown =
              PrayerTime.getNextPrayerCountDown(prayerTimes);

          return Container(
            height: screenSize.height * 0.41,
            width: screenSize.width,
            decoration: BoxDecoration(
              color: AppTheme.brown,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/time_forground.png',
                  height: screenSize.height * 0.41,
                  fit: BoxFit.fill,
                ),
                Column(
                  children: [
                    SizedBox(height: screenSize.height * 0.02),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            DateFormatter.fromGregorianDate(
                              data.data.date!.gregorian!,
                            ),
                            style: textTheme.titleMedium,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Pray Time',
                                  style: textTheme.titleLarge!.copyWith(
                                    color: AppTheme.black.withValues(
                                      alpha: 0.71,
                                    ),
                                  ),
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    customButton: Icon(
                                      Icons.location_on_rounded,
                                      color: AppTheme.brown,
                                      size: 30,
                                    ),
                                    openWithLongPress: true,
                                    items: [
                                      ...MenuItems.firstItems.map(
                                        (item) => DropdownMenuItem<MenuItem>(
                                          value: item,
                                          child: MenuItems.buildItem(item),
                                        ),
                                      ),
                                      const DropdownMenuItem<Divider>(
                                        enabled: false,
                                        child: Divider(),
                                      ),
                                      ...MenuItems.secondItems.map(
                                        (item) => DropdownMenuItem<MenuItem>(
                                          value: item,
                                          child: MenuItems.buildItem(item),
                                        ),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      MenuItems.onChanged(
                                        context,
                                        value! as MenuItem,
                                      );
                                      ApiManager.getPrayerData();
                                      setState(() {});
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      width: 160,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: AppTheme.primary,
                                      ),
                                      offset: const Offset(40, -4),
                                    ),
                                    menuItemStyleData: MenuItemStyleData(
                                      customHeights: [
                                        ...List<double>.filled(
                                          MenuItems.firstItems.length,
                                          48,
                                        ),
                                        8,
                                        ...List<double>.filled(
                                          MenuItems.secondItems.length,
                                          48,
                                        ),
                                      ],
                                      padding: const EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${data.data.date!.hijri!.weekday!.ar}-${data.data.date!.hijri!.weekday!.en}',
                              style: textTheme.titleMedium!.copyWith(
                                color: AppTheme.black.withValues(alpha: 0.90),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            DateFormatter.fromHijriDate(data.data.date!.hijri!),
                            style: textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.01),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.045),
                    SizedBox(
                      height: screenSize.height * 0.20,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          height: screenSize.height * 0.22,
                          enlargeCenterPage: true,
                          viewportFraction: 0.30,
                          enlargeFactor: 0.2,
                        ),
                        itemBuilder: (_, index, _) => CardItem(
                          prayerName: prayerTimes.keys.elementAt(index),
                          prayerTime: prayerTimes.values.elementAt(index),
                        ),
                        itemCount: prayerTimes.length,
                      ),
                    ),
                    CountDownTimer(
                      playAdhan: playAdhan,
                      stopAdhan: stopAdhan,
                      timeRemaining: prayerCountDown[prayerTimes.keys.first]!,
                      getPrayingDate: () {
                        ApiManager.getPrayerData();
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Column(
            children: [
              Text('Something went wrong'),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ApiManager.getPrayerData();
                  });
                },
                child: Text('Retry'),
              ),
            ],
          );
        }
      },
    );
  }
}
