import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/src/audio_cache.dart';
import 'package:slido/utils.dart';

class Music extends StatelessWidget {
  bool Play_pause = true;
  final Player = AudioPlayer();
  final duration = Duration();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: GestureDetector(
        onTap: () => CheckPlay(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.cyanAccent.shade100.withOpacity(.4),
                    Colors.lightBlueAccent.shade100.withOpacity(.2)
                  ])),
          child: Icon(Icons.music_note),
        ),
      ),
    ));
  }

  Future<void> CheckPlay() async {
    if (Play_pause) {
      await Player.play(
          AssetSource('assets/audio/please-calm-my-mind-125566.mp3'));
      Play_pause = false;
    } else {
      await Player.pause();
      Play_pause = true;
    }
  }
}
