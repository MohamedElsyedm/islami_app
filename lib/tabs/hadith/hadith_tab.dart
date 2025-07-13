import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/tabs/hadith/hadeth_item.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: double.infinity,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
        ),
        itemBuilder: (_, index, _) => HadithItem(index: index),
        itemCount: 50,
      ),
    );
  }
}
