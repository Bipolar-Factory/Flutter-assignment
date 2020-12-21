import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioBox extends StatefulWidget {
  @override
  _AudioBoxState createState() => _AudioBoxState();
}

class _AudioBoxState extends State<AudioBox> {
  AudioPlayer audioPlayer = AudioPlayer();

  bool isPlaying = false;
  bool isStarted = false;
  Duration duration;
  int time;

  String timeLeft = "";
  double progress = 0.0;

  startPlaying() async {
    if (!isStarted) {
      await audioPlayer.play(
        "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_2MG.mp3",
      );
      isStarted = true;
    } else
      await audioPlayer.resume();
    // time  = await audioPlayer.getDuration();
  }

  getTimeLeft() {
    if (duration == null) {
      setState(() {
        timeLeft = "Time Left 0s";
      });
    } else {
      setState(() {
        timeLeft = "Time Left ${duration.inSeconds}s";
      });
    }
  }

  getProgress() {
    if (time == null || duration == null) {
      setState(() {
        progress = 0.0;
      });
    } else {
      setState(() {
        progress = time / (duration.inMilliseconds);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    audioPlayer.onAudioPositionChanged.listen((Duration p) async {
      time = await audioPlayer.getDuration();
      duration = p;
      if (duration == null) {
        timeLeft = "0s - 0s";
      } else {
        timeLeft = "${duration.inSeconds}s - ${time / 1000}s";
      }
      if (time == null || duration == null) {
        progress = 0.0;
      } else {
        progress = (duration.inMilliseconds) / time;
      }
      setState(() {});
    });
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState state) {
      if (state == AudioPlayerState.PLAYING) {
        setState(() {
          isPlaying = true;
        });
      } else {
        if (mounted) {
          setState(() {
            isPlaying = false;
          });
        }
      }
    });
  }

  @override
  void dispose() async {
    await audioPlayer.release();
    await audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: <Widget>[
            LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              backgroundColor: Colors.grey,
              value: progress,
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(timeLeft),
            SizedBox(
              height: 16.0,
            ),
            Center(
              child: IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                onPressed: () {
                  isPlaying ? audioPlayer.pause() : startPlaying();
                  setState(() {});
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
