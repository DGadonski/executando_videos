// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true),
    ));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  VideoPlayerController? _controller;
  Uri uri = Uri(
      path:
          'https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4');

  @override
  void initState() {
    super.initState();
    /*_controller = VideoPlayerController.networkUrl(uri)
      ..initialize().then((_) {
        setState(() {
          _controller!.play();
        });
      });*/

    _controller = VideoPlayerController.asset("videos/exemplo.mp4")
      ..setLooping(true)
      ..initialize().then((_) {
        _controller!.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Executando vídeos'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: _controller!.value.aspectRatio,
          child: VideoPlayer(_controller!),
        ),
      ),
    );
  }
}
