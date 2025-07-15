import 'package:flutter/material.dart';
import 'package:sim_tiktok/domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {


  bool initialLoading = true;

  final List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    // TODO: Implement loadNextPage

    notifyListeners();
  }
}