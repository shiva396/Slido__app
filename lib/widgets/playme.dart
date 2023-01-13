import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Playme extends StatefulWidget {
  const Playme({super.key});

  @override
  State<Playme> createState() => _PlaymeState();
}

class _PlaymeState extends State<Playme> {
  final player = AudioPlayer();
  // String audiodir = "assets/audio/calmsound.mp3";
  bool Play_pause = true;
  @override
  @override
  Widget build(BuildContext context) {
    IconData play = Icons.play_arrow;
    IconData pause = Icons.pause;
    late IconData pt = play;

    return Center(
      child: GestureDetector(
          onTap: () => {
                setState(() => {
                      if (Play_pause)
                        {
                          player.setSource(AssetSource('audio/calmsound.mp3')),
                          Play_pause = false,
                          pt = play
                        }
                      else
                        {player.pause(), Play_pause = true, pt = pause}
                    }),
              },
          child: Container(
              child: Icon(
            pt,
            color: Colors.white,
          ))),
    );
  }
}
