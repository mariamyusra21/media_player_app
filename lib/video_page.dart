// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class Video_Player_Widget extends StatelessWidget {
//   VideoPlayerController controller;
//   Video_Player_Widget({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) =>
//       controller != null && controller.value.isInitialized
//           ? Container(
//               alignment: Alignment.topCenter,
//               child: buildVideo(),
//             )
//           : Container(
//               height: 200,
//               child: const Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//   Widget buildVideo() => AspectRatio(
//       aspectRatio: controller.value.aspectRatio,
//       child: VideoPlayer(controller));
//   // {
//   //   return Scaffold(
//   //       appBar: AppBar(
//   //         title: Text(
//   //           "Video Player",
//   //           style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//   //         ),
//   //         centerTitle: true,
//   //       ),
//   //       body: Container());
//   // }
// }
