import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';
import 'package:sim_tiktok/presentation/providers/discover_provider.dart';
import 'package:sim_tiktok/domain/entities/video_post.dart';

import 'background.dart';

class FullScreenPlayer extends StatefulWidget {
  final VideoPost videoPost;

  const FullScreenPlayer({super.key, required this.videoPost});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController videoPlayerController;
  bool isInitialized = false;
  bool isPlaying = false;
  bool isMuted = false;
  bool showControls = false;
  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;

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
    videoPlayerController = VideoPlayerController.asset(
      widget.videoPost.videoUrl,
    );
    try {
      await videoPlayerController.initialize();
      if (mounted) {
        setState(() {
          isInitialized = true;
          totalDuration = videoPlayerController.value.duration;
        });

        // Configurar listeners
        videoPlayerController.addListener(_videoListener);

        // Reproducir el video y activar el loop
        await videoPlayerController.setLooping(true);
        await videoPlayerController.play();
        setState(() {
          isPlaying = true;
        });

        // Incrementar vistas
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<DiscoverProvider>().incrementViews(widget.videoPost.id);
        });
      }
    } catch (e) {
      debugPrint('Error al inicializar el video: $e');
    }
  }

  void _videoListener() {
    if (mounted) {
      setState(() {
        currentPosition = videoPlayerController.value.position;
      });
    }
  }

  void _togglePlayPause() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      videoPlayerController.play();
      setState(() {
        isPlaying = true;
      });
    }
  }

  void _toggleMute() {
    setState(() {
      isMuted = !isMuted;
    });
    videoPlayerController.setVolume(isMuted ? 0.0 : 1.0);
  }

  void _showControlsTemporarily() {
    setState(() {
      showControls = true;
    });
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          showControls = false;
        });
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    return GestureDetector(
      onTap: _showControlsTemporarily,
      onDoubleTap: _togglePlayPause,
      child: AspectRatio(
        aspectRatio: videoPlayerController.value.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(videoPlayerController),
            // Gradiente
            const Background(),

            // Controles de video
            if (showControls) _buildVideoControls(),

            // Información del video
            Positioned(
              bottom: 30,
              left: 25,
              right: 80,
              child: _VideoInfo(videoPost: widget.videoPost),
            ),

            // Indicador de progreso
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildProgressBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoControls() {
    return Container(
      color: Colors.black.withOpacity(0.3),
      child: Center(
        child: IconButton(
          onPressed: _togglePlayPause,
          icon: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            size: 60,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      height: 3,
      child: LinearProgressIndicator(
        value: totalDuration.inMilliseconds > 0
            ? currentPosition.inMilliseconds / totalDuration.inMilliseconds
            : 0.0,
        backgroundColor: Colors.grey.withOpacity(0.3),
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }
}

class _VideoInfo extends StatelessWidget {
  final VideoPost videoPost;

  const _VideoInfo({required this.videoPost});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Información del usuario
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[300],
              child: videoPost.userAvatar != null
                  ? ClipOval(
                      child: Image.asset(
                        videoPost.userAvatar!,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Text(
                      videoPost.username[0].toUpperCase(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '@${videoPost.username}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  if (videoPost.isFollowing)
                    const Text(
                      'Siguiendo',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                ],
              ),
            ),
            Consumer<DiscoverProvider>(
              builder: (context, provider, child) {
                return GestureDetector(
                  onTap: () => provider.toggleFollow(videoPost.username),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: videoPost.isFollowing
                          ? Colors.transparent
                          : Colors.red,
                      border: Border.all(
                        color: videoPost.isFollowing
                            ? Colors.white
                            : Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      videoPost.isFollowing ? 'Siguiendo' : 'Seguir',
                      style: TextStyle(
                        color: videoPost.isFollowing
                            ? Colors.white
                            : Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 15),

        // Caption
        Text(
          videoPost.caption,
          style: const TextStyle(fontSize: 14, color: Colors.white),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),

        const SizedBox(height: 10),

        // Hashtags
        if (videoPost.hashtags != null)
          Text(
            videoPost.hashtags!,
            style: const TextStyle(fontSize: 12, color: Colors.blue),
          ),

        const SizedBox(height: 10),

        // Música
        if (videoPost.musicTitle != null)
          Row(
            children: [
              const Icon(Icons.music_note, color: Colors.white, size: 16),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  videoPost.musicTitle!,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
