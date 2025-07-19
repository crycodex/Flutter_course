import 'package:flutter/material.dart';
import 'package:sim_tiktok/domain/entities/video_post.dart';
import 'package:sim_tiktok/presentation/widgets/shared/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        //video post
        final VideoPost videosPost = videos[index];

        return Stack(
          children: [
            Positioned(
              bottom: 10,
              right: 10,
              child: VideoButtons(videoPost: videosPost),
            ),
          ],
        );
      },
    );
  }
}
