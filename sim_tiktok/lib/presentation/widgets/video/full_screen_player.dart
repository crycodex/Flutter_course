import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'background.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;
  final String name;

  const FullScreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption,
    required this.name,
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController videoPlayerController;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  Future<void> _initializeVideo() async {
    videoPlayerController = VideoPlayerController.asset(widget.videoUrl);
    try {
      await videoPlayerController.initialize();
      if (mounted) {
        setState(() {
          isInitialized = true;
        });
        // Reproducir el video y activar el loop
        await videoPlayerController.setLooping(true);
        await videoPlayerController.play();
      }
    } catch (e) {
      debugPrint('Error al inicializar el video: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return GestureDetector(
      onTap: () {
        if (videoPlayerController.value.isPlaying) {
          videoPlayerController.pause();
        } else {
          videoPlayerController.play();
        }
      },
      child: AspectRatio(
        aspectRatio: videoPlayerController.value.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(videoPlayerController),
            //gradiente
            const Background(),
            //caption
            Positioned(
              bottom: 30,
              left: 25,
              right: 0,
              child: _VideoCaption(name: widget.name, caption: widget.caption),
            ),
          ],
        ),
      ),
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String name;
  final String caption;

  const _VideoCaption({required this.name, required this.caption});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(caption, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
