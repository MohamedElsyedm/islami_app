import 'package:flutter/material.dart';
import 'package:islami_app/models/azkar_model.dart';

import 'package:islami_app/time/azkar_card.dart';

class AzkarSection extends StatefulWidget {
  const AzkarSection({super.key});

  @override
  State<AzkarSection> createState() => _AzkarSectionState();
}

class _AzkarSectionState extends State<AzkarSection> {
  List<AzkarCategoryModel> azkarCategoriesList = [
    AzkarCategoryModel(azkarImage: 'morning_azkar', azkarName: "أذكار الصباح"),
    AzkarCategoryModel(azkarImage: 'evening_azkar', azkarName: "أذكار المساء"),
    AzkarCategoryModel(
      azkarImage: 'after_prayer',
      azkarName: "أذكار بعد السلام من الصلاة المفروضة",
    ),
    AzkarCategoryModel(azkarImage: 'tasabes', azkarName: "تسابيح"),
    AzkarCategoryModel(azkarImage: 'sleep', azkarName: "أذكار النوم"),
    AzkarCategoryModel(azkarImage: 'wake_up', azkarName: "أذكار الاستيقاظ"),
    AzkarCategoryModel(
      azkarImage: 'quranic_supplications',
      azkarName: "أدعية قرآنية",
    ),
    AzkarCategoryModel(
      azkarImage: 'Prophets_supplications',
      azkarName: "أدعية الأنبياء",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text('Azkar', style: Theme.of(context).textTheme.titleMedium),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.7,
          child: GridView.builder(
            itemCount: azkarCategoriesList.length,
            padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 185 / 259,
            ),
            itemBuilder: (_, index) {
              return AzkarCard(
                azkar: azkarCategoriesList[index].azkarImage,
                azkarName: azkarCategoriesList[index].azkarName,
              );
            },
          ),
        ),
      ],
    );
  }
}
