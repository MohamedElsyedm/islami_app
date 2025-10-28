import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/time/azkar_item_list.dart';

class AzkarCard extends StatelessWidget {
  const AzkarCard({super.key, required this.azkarName, required this.azkar});
  final String azkar;
  final String azkarName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => AzkarItemList(azkarName: azkarName),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.primary, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/${azkar}.png'),
            Text(
              azkarName,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

//#بسم الله ح نقول اشعار
//# الاصرار دا سلاح جبار
