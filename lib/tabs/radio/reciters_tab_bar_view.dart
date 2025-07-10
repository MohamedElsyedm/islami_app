import 'package:flutter/material.dart';
import 'package:islami_app/tabs/radio/radio_item.dart';
import 'package:islami_app/tabs/radio/radio_services.dart';

class RecitersTabBarView extends StatelessWidget {
  const RecitersTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>
          Divider(height: 8, color: Colors.transparent),
      itemCount: RadioServices.recitersListNames.length,
      itemBuilder: (_, index) {
        return RadioItem(RadioServices.recitersListNames[index]);
      },
    );
  }
}
