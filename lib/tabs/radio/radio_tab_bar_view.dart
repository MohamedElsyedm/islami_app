import 'package:flutter/material.dart';
import 'package:islami_app/tabs/radio/radio_item.dart';
import 'package:islami_app/tabs/radio/radio_services.dart';

class RadioTabBarView extends StatelessWidget {
  const RadioTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>
          Divider(height: 8, color: Colors.transparent),
      itemCount: RadioServices.radioListNames.length,
      itemBuilder: (_, index) {
        return RadioItem(RadioServices.radioListNames[index]);
      },
    );
  }
}
