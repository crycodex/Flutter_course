import 'package:flutter/material.dart';
import 'package:sim_tiktok/domain/entities/video_post.dart';
import 'package:sim_tiktok/infraestructure/models/local_video_model.dart';
import 'package:sim_tiktok/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;

  final List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newVideo = videoPost
        .map(
          (video) => LocalVideoModel.fromJson(video).toVdeoPostEntity(),
        )
        .toList();

    videos.addAll(newVideo);
    initialLoading = false;
    notifyListeners();
  }
}
