import 'package:flutter/material.dart';
import 'package:sim_tiktok/domain/entities/video_post.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Container(
          color: Colors.grey[800],
          child: const Center(child: Text('No more videos')),
        ),
      ],
    );
  }
}
