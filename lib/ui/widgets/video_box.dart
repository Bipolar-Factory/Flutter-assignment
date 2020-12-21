import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoBox extends StatefulWidget {
  final String video;

  const VideoBox({Key key, this.video}) : super(key: key);

  @override
  _VideoBoxState createState() => _VideoBoxState();
}

class _VideoBoxState extends State<VideoBox> {
  VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      'https://www.sample-videos.com/video123/mp4/360/big_buck_bunny_360p_1mb.mp4'
    );
    _controller
      ..initialize().then((_) {
        _controller.setLooping(true);
        setState(() {});
      });
    _controller
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(() {});
    _controller.dispose();
    super.dispose();
  }

  Widget getButton() {
    if (_controller.value.isPlaying) {
      return IconButton(
        icon: Icon(Icons.pause),
        onPressed: () {
          _controller.pause();
          setState(() {});
        },
      );
    } else if (_controller.value.isBuffering) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      );
    }
    return IconButton(
      icon: Icon(Icons.play_arrow),
      onPressed: () {
        _controller.play();
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _controller.value.initialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(
                height: 100,
                alignment: Alignment.center,
                child: Text('Please wait'),
              ),
        Center(child: getButton()),
      ],
    );
  }
}
