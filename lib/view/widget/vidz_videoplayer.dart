// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TikTokeVideoPlayer extends StatefulWidget {
  String videourl;
  TikTokeVideoPlayer({Key? key,required this.videourl}) : super(key: key);

  @override
  State<TikTokeVideoPlayer> createState() => _TikTokeVideoPlayerState();
}

class _TikTokeVideoPlayerState extends State<TikTokeVideoPlayer> {

  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videourl)..initialize().then((value) {
      videoPlayerController.play();
    });
  }
  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height ,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: VideoPlayer(videoPlayerController),
    );
  }
}
