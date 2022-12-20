// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
//
// class RunMusic extends StatefulWidget {
//   const RunMusic({Key? key}) : super(key: key);
//
//   @override
//   State<RunMusic> createState() => _RunMusicState();
// }
//
// class _RunMusicState extends State<RunMusic> {
//   late AudioPlayer audioPlayer;
//   String durasi = "00:00:00";
//
//   _RunMusicState() {
//     audioPlayer = AudioPlayer();
//     audioPlayer.onDurationChanged.listen((duration) {
//       setState(() {
//         durasi = duration.toString();
//       });
//     });
//     audioPlayer.setReleaseMode(ReleaseMode.loop);
//   }
//
//   void playSound(url) async {
//     await audioPlayer.play(url);
//   }
//
//   void pauseSound() async {
//     await audioPlayer.pause();
//   }
//
//   void stopSound() async {
//     await audioPlayer.stop();
//   }
//
//   void resumeSound() async {
//     audioPlayer.resume();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Playing Music'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     playSound("https://open.noice.id/catalog/d57da0b0-9f54-430b-a295-325d9855dacd");
//                   },
//                   child: const Text("Play")),
//               ElevatedButton(
//                   onPressed: () {
//                     pauseSound();
//                   },
//                   child: const Text("Pause")),
//               ElevatedButton(
//                   onPressed: () {
//                     stopSound();
//                   },
//                   child: const Text("Stop")),
//               ElevatedButton(
//                   onPressed: () {
//                     resumeSound();
//                   },
//                   child: const Text("Resume")),
//               Text(
//                 durasi,
//                 style:
//                     const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
