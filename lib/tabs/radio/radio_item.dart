import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';

class RadioItem extends StatefulWidget {
  String name;
  RadioItem(this.name);

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool playClick = false;
  bool volumeClick = false;

  void _toggleVolume() {
    setState(() {
      volumeClick = !volumeClick;
    });
    print(volumeClick);
  }

  void _togglePlay() {
    setState(() {
      playClick = !playClick;
    });
    print(playClick);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.15,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Image.asset(
          playClick
              ? 'assets/images/volume_play.png'
              : 'assets/images/details_footer.png',
          color: AppTheme.black.withValues(alpha: 0.2),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.name,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: AppTheme.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 44,
                  onPressed: _togglePlay,
                  icon: playClick ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                ),
                IconButton(
                  onPressed: _toggleVolume,
                  icon: Icon(
                    volumeClick
                        ? Icons.volume_off_rounded
                        : Icons.volume_up_rounded,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
