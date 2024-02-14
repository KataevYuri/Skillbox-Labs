import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'));

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((value) => setState(
          () {},
        ));
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lab #18.2 - Video player'),
        ),
        body: SizedBox(
          height: 400,
          width: double.infinity,
          child: Column(children: [
            _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
            VideoProgressIndicator(_controller, allowScrubbing: true),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () => _controller.seekTo(Duration(
                            seconds:
                                _controller.value.position.inSeconds - 10)),
                        child: const Text('-10'))),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () => _controller.seekTo(Duration(
                            seconds:
                                _controller.value.position.inSeconds + 10)),
                        child: const Text('+10')))
              ],
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
