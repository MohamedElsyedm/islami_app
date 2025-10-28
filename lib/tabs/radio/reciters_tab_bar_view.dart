import 'package:flutter/material.dart';
import 'package:islami_app/api/api_manager.dart';
import 'package:islami_app/models/reciters_response_model/moshaf.dart';
import 'package:islami_app/models/reciters_response_model/reciter.dart';
import 'package:islami_app/tabs/radio/radio_item.dart';
import 'package:just_audio/just_audio.dart';

class RecitersTabBarView extends StatefulWidget {
  const RecitersTabBarView({super.key});

  @override
  State<RecitersTabBarView> createState() => _RecitersTabBarViewState();
}

class _RecitersTabBarViewState extends State<RecitersTabBarView> {
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getRecitersData(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (asyncSnapshot.hasError) {
          return Center(child: Text("Error: ${asyncSnapshot.error}"));
        } else if (asyncSnapshot.hasData) {
          List<Reciter> reciters =
              asyncSnapshot.data!.reciters as List<Reciter>;

          return ListView.separated(
            separatorBuilder: (context, index) =>
                Divider(height: 8, color: Colors.transparent),
            itemCount: reciters.length,
            itemBuilder: (_, index) {
              List<Moshaf> moshafs = reciters[index].moshaf!;
              int suraNumber = 1;
              String suraUrl = ApiManager.getMoshafSuraUrl(
                moshafs[0].server!,
                suraNumber.toString(),
              );

              return RadioItem(
                name: reciters[index].name!,
                onPause: () {
                  audioPlayer.setUrl(suraUrl);
                  audioPlayer.pause();
                },
                onPlay: () {
                  audioPlayer.processingStateStream.listen((state) {
                    if (state == ProcessingState.completed) {
                      print("✅ Track Finished! Preparing next Surah...");

                      if (suraNumber >= 114) {
                        audioPlayer.stop();
                        return;
                      }
                      suraNumber++;
                      suraUrl = ApiManager.getMoshafSuraUrl(
                        moshafs[0].server!,
                        suraNumber.toString(),
                      );

                      audioPlayer.setUrl(suraUrl);
                      audioPlayer.play();
                    }
                  });
                  audioPlayer.setUrl(suraUrl);
                  audioPlayer.play();
                },
                onVolumeOn: () {
                  audioPlayer.setUrl(suraUrl);
                  audioPlayer.setVolume(1.0);
                },
                onVolumeOff: () {
                  audioPlayer.setUrl(suraUrl);
                  audioPlayer.setVolume(0.0);
                },
              );
            },
          );
        } else {
          return Center(child: Text("No Data"));
        }
      },
    );
  }
}
