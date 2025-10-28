import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';

class CountDownTimer extends StatefulWidget {
  CountDownTimer({
    super.key,
    required this.getPrayingDate,
    required this.playAdhan,
    required this.stopAdhan,
    required this.timeRemaining,
  });
  Duration timeRemaining;
  final void Function() getPrayingDate;
  final void Function() playAdhan;
  final void Function() stopAdhan;

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  late Timer timer;

  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (widget.timeRemaining.inSeconds > 0) {
          widget.timeRemaining -= const Duration(seconds: 1);
        } else {
          timer.cancel();
          widget.getPrayingDate();
          widget.playAdhan();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String hours = duration.inHours.toString().padLeft(2, "0");
    String minutes = duration.inMinutes
        .remainder(60)
        .toString()
        .padLeft(2, "0");
    String seconds = duration.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, "0");

    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Text(
          'Next Pray - ',
          style: textTheme.titleMedium!.copyWith(
            color: AppTheme.black.withValues(alpha: 75),
          ),
        ),
        Text(
          _formatDuration(widget.timeRemaining),
          style: textTheme.titleMedium!.copyWith(color: AppTheme.black),
        ),
        SizedBox(width: screenSize.width * 0.1),
        IconButton(
          padding: EdgeInsets.only(right: 35),
          onPressed: () {
            setState(() {
              isMuted = !isMuted;
              if (isMuted) {
                widget.stopAdhan;
              } else if (!isMuted) {
                widget.playAdhan;
              }
            });
          },
          icon: Icon(
            isMuted ? CupertinoIcons.volume_off : CupertinoIcons.volume_up,
            size: 30,
          ),
        ),
      ],
    );
  }
}
