import 'package:flutter/material.dart';
import 'package:sim_tiktok/domain/entities/video_post.dart';
import 'package:sim_tiktok/config/helpers/num_format.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost videoPost;
  const VideoButtons({super.key, required this.videoPost});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _customIcon(
          value: videoPost.likes,
          icon: Icons.favorite_border_outlined,
          color: Colors.white,
        ),
        _customIcon(
          value: videoPost.comments,
          icon: Icons.chat_bubble_outline_outlined,
          color: Colors.white,
        ),
        _customIcon(
          value: videoPost.views,
          icon: Icons.remove_red_eye_outlined,
          color: Colors.white,
        ),
      ],
    );
  }
}

class _customIcon extends StatelessWidget {
  final int value;
  final IconData icon;
  final Color color;

  const _customIcon({
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon, color: color),
        ),
        Text(NumFormat.numberFormat(value.toDouble())),
      ],
    );
  }
}
