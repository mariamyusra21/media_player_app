import 'package:flutter/material.dart';
import 'package:media_player_app/music_library.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  //  UnComment these to check error of video_player having no null safety error...
  //
  // late VideoPlayerController videoController;
  // final asset = 'assets/video.mp4';

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   videoController = VideoPlayerController.asset(asset)
  //     ..addListener(() {
  //       setState(() {});
  //     })
  //     ..setLooping(true)
  //     ..initialize().then((value) => videoController.play());
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   videoController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Media Player App",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MusicLibrary())),
                child: Text(
                  'Go to Audio Player',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            ElevatedButton(
                onPressed: () {
                  //
                  // Un Comment these to see the error in video_player...
                  //
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Video_Player_Widget(
                  //               controller: videoController,
                  //             )));
                },
                child: Text(
                  'Go to Video Player',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      )),
    );
  }
}
