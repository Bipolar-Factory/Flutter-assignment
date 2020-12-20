import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern_chat/components/MessageComposer.dart';
import 'package:intern_chat/data/MessageType.dart';
import 'package:video_player/video_player.dart';

class ChatInstance extends StatefulWidget {
  final String targetUsername;

  const ChatInstance({Key key, @required this.targetUsername})
      : super(key: key);

  @override
  _ChatInstanceState createState() => _ChatInstanceState();
}

class _ChatInstanceState extends State<ChatInstance> {
  //Video player deceleration
  final videoPlayerController =
      VideoPlayerController.asset("assets/videos/sample.mp4");
  ChewieController cc;

  //flags
  bool isLoading = true; //Flag boolean for initialization of video player
  bool playing = false;

  //Deceleration of Audio player and cache
  AudioPlayer _player;
  AudioCache audioCache;

  //Variables to hold current and max duration of audio
  Duration position = new Duration();
  Duration audioLength = new Duration();

  @override
  void initState() {
    super.initState();

    //Initializing video player
    setupVideo();

    //Initializing audio player and cache
    _player = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: _player);

    //using onDurationChanged event to change the max duration value
    _player.onDurationChanged.listen((event) {
      setState(() {
        audioLength = event;
      });
    });

    //Using onAudioPositionChanged to change the current position and slider
    _player.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });

    //preloading Audio file
    audioCache.load("sample.mp3");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.targetUsername ?? "Username"),
          backgroundColor: Colors.blue[800]),
      body: Column(
        children: [
          Flexible(
            child: Container(
              child: ListView(
                reverse: true,
                children: [
                  //Three message of types Image, Audio, Video.
                  buildMessage(true, MessageType.Image),
                  buildMessage(false, MessageType.Audio),
                  buildMessage(true, MessageType.Video),
                ],
              ),
            ),
          ),
          MessageComposer(),//Widget from MessageComposer file
        ],
      ),
    );
  }

  Widget buildMessage(bool isOwner, MessageType mt) {
    return SafeArea(
      child: Container(
        //Using isOwner flag to check if the message sent by the user or the contact
        padding:
            EdgeInsets.only(left: isOwner ? 0 : 18, right: isOwner ? 18 : 0),
        margin: EdgeInsets.symmetric(vertical: 8.0),
        width: MediaQuery.of(context).size.width * 0.8,
        alignment: isOwner ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: isOwner
              ? EdgeInsets.symmetric(horizontal: 12, vertical: 8)
              : EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          //Getting message body depending upon the type of message using MessageType Enumerator
          child: getBody(mt),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isOwner
                    ? ([Colors.blueGrey, Colors.black54])
                    : ([Color(0xff64769e), Color(0xff64769e)]),
              ),
              borderRadius: isOwner
                  ? BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                      bottomLeft: Radius.circular(18))
                  : BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                      bottomRight: Radius.circular(18))),
        ),
      ),
    );
  }

  getBody(MessageType messageType) {
    if (messageType == MessageType.Image) {
      //If the message is Image
      return Container(
        child: FadeInImage.assetNetwork(
          image:
              "https://imaging.nikon.com/lineup/dslr/df/img/sample/img_01_l.jpg",
          //Using a placeholder while the image loads from network.
          placeholder: 'assets/images/loading.gif',
        ),
      );
    } else if (messageType == MessageType.Video) {
      //If the message is Video
      if (isLoading) {
        //Using isLoading flag to let video player initialized
        return CircularProgressIndicator();
      }
      return Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.2,
          ),
          child: Chewie(
            controller: cc,
          ));
    } else if (messageType == MessageType.Audio) {
      //If the message is audio
      return Container(
          child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.mic),
          slider(),
          Text([position.inMinutes, position.inSeconds]
              .map((e) => e.remainder(60).toString().padLeft(2, '0'))
              .join(':')),
          InkWell(
              onTap: () {
                if (!playing) {
                  audioCache.play("sample.mp3");
                  setState(() {
                    playing = true;
                  });
                } else {
                  _player.pause();
                  setState(() {
                    playing = false;
                  });
                }
              },
              child: Icon(
                playing ? Icons.pause : Icons.play_arrow,
                size: 30,
              )),
        ],
      ));
    }
  }

  Widget slider() {
    //Slider to seek duration of the audio file
    return Expanded(
      child: Slider.adaptive(
        activeColor: Colors.blue[800],
        inactiveColor: Colors.grey[300],
        value: position.inSeconds.toDouble(),
        max: audioLength.inSeconds.toDouble(),
        onChanged: (val) {
          seekToSec(val.toInt());
        },
      ),
    );
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  setupVideo() async {
    //Setting up video player by initializing it and setting option like auto-play, etc.
    isLoading = true;
    await videoPlayerController.initialize();

    cc = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: false,
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    //Disposing of controllers once the user leaves the page.
    videoPlayerController.dispose();
    _player.pause();
    _player.dispose();
    cc.dispose();
    super.dispose();
  }
}
