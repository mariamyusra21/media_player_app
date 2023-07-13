import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'model/music_data_response.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key, required this.response}) : super(key: key);
  final MusicDataResponse response;
  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    // listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    // listen to audio position
    audioPlayer.onPositionChanged.listen((newPosition) {
      position = newPosition;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final url = widget.response.image.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Music Play",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                height: MediaQuery.of(context).size.height / 2.75,
                url,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              widget.response.title.toString(),
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.response.artist.toString(),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Slider(
                value: position.inSeconds.toDouble(),
                min: 0,
                activeColor: Colors.blue.shade600,
                max: duration.inSeconds.toDouble(),
                onChanged: (value) async {
                  position = Duration(seconds: value.toInt());
                  audioPlayer.seek(position);
                  // optional :Play audio if was paused
                  audioPlayer.resume();
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(this.position)),
                  Text(formatTime(this.duration - position)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 35,
                  child: IconButton(
                    onPressed: () async {
                      this.audioPlayer.setPlaybackRate(0.5);
                    },
                    icon: Icon(Icons.skip_previous),
                    iconSize: 50,
                  ),
                ),
                CircleAvatar(
                  radius: 35,
                  child: IconButton(
                    onPressed: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        await audioPlayer.resume();
                      }
                    },
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    iconSize: 50,
                  ),
                ),
                CircleAvatar(
                  radius: 35,
                  child: IconButton(
                    onPressed: () async {
                      this.audioPlayer.setPlaybackRate(1.5);
                    },
                    icon: Icon(Icons.skip_next_rounded),
                    iconSize: 50,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // void next() async {
  //   await audioPlayer.pause().then((value) => audioPlayer.play(widget.response.source.indexOf()));
  // }

  // void prev() async {
  //   await audioPlayer.pause().then((value) => audioPlayer.previous());
  // }

  Future<void> setAudio() async {
    // Repeat song when completed
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    await audioPlayer.setSourceUrl(widget.response.source.toString());
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, twoDigitMinutes, twoDigitSeconds]
        .join(':');
  }
}
