import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:slido/utils.dart';

class PlayPauseButton extends StatefulWidget {
  @override
  _PlayPauseButtonState createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      IconButton(
        icon: _isPlaying
            ? Icon(
                Icons.pause,
                color: Colors.white,
                size: 25,
              )
            : Icon(Icons.play_arrow, color: Colors.white, size: 25),
        onPressed: _handlePlayPause,
      ),
    ]));
  }

  void _handlePlayPause() async {
    if (_isPlaying) {
      _audioPlayer.pause();
      {
        setState(() {
          _isPlaying = false;
        });
      }
    } else {
      _audioPlayer.play(AssetSource('audio/calmsound1.mp3'));
      loop();
      {
        setState(() {
          _isPlaying = true;
        });
      }
    }
  }

  void loop(){
        _audioPlayer.setReleaseMode(ReleaseMode.loop);
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    super.dispose();
  }
}
