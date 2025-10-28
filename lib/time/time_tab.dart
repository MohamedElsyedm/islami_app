import 'package:flutter/material.dart';
import 'package:islami_app/time/azkar_section.dart';
import 'package:islami_app/time/time_card.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(children: [TimeCard(), AzkarSection()]),
      ),
    );
  }
}
