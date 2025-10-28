import 'package:flutter/material.dart';
import 'package:islami_app/api/api_manager.dart';
import 'package:islami_app/models/radios_response_model/radios_list.dart';
import 'package:islami_app/tabs/radio/radio_item.dart';
import 'package:just_audio/just_audio.dart';

class RadioTabBarView extends StatefulWidget {
  const RadioTabBarView({super.key});

  @override
  State<RadioTabBarView> createState() => _RadioTabBarViewState();
}

class _RadioTabBarViewState extends State<RadioTabBarView> {
 final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getRadiosData(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (asyncSnapshot.hasError) {
          return Center(child: Text("Error: ${asyncSnapshot.error}"));
        } else if (asyncSnapshot.hasData) {
          List<RadiosList> radios = asyncSnapshot.data as List<RadiosList>;
          return ListView.separated(
            separatorBuilder: (context, index) =>
                Divider(height: 8, color: Colors.transparent),
            itemCount: radios.length,
            itemBuilder: (_, index) {
              return RadioItem(name: radios[index].name!, onPlay: () {
    audioPlayer.setUrl(radios[index].url!);
    audioPlayer.play();
              }, onPause: () {
                    audioPlayer.setUrl(radios[index].url!);
    audioPlayer.pause();
              }, onVolumeOn: () {
                    audioPlayer.setUrl(radios[index].url!);
    audioPlayer.setVolume(1.0);
              }, onVolumeOff: () {
                    audioPlayer.setUrl(radios[index].url!);
    audioPlayer.setVolume(0.0);
              },);
            },
          );
        } else {
          return Center(child: Text("No Data"));
        }
      },
    );
  }
}
