import 'package:flutter/material.dart';
import 'package:islami_app/api/date_utils.dart';
import 'package:islami_app/app_theme.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.prayerName,
    required this.prayerTime,
  });
  final String prayerName;
  final String prayerTime;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.brown,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
            colors: [AppTheme.black, AppTheme.primaryOff],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(prayerName, style: textTheme.titleMedium),
            Text(
              TimeConverter.to12Hour(prayerTime),
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium!.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
