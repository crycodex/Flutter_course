import 'package:flutter/material.dart';
import 'package:sim_tiktok/domain/entities/video_post.dart';
import 'package:sim_tiktok/infraestructure/models/local_video_model.dart';
import 'package:sim_tiktok/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  bool isLoadingMore = false;
  final List<VideoPost> videos = [];
  final Set<String> likedVideos = {};
  final Set<String> followingUsers = {};

  Future<void> loadNextPage() async {
    if (isLoadingMore) return;

    isLoadingMore = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newVideos = videoPost
        .map((video) => LocalVideoModel.fromJson(video).toVdeoPostEntity())
        .toList();

    videos.addAll(newVideos);
    initialLoading = false;
    isLoadingMore = false;
    notifyListeners();
  }

  void toggleLike(String videoId) {
    if (likedVideos.contains(videoId)) {
      likedVideos.remove(videoId);
      final index = videos.indexWhere((video) => video.id == videoId);
      if (index != -1) {
        videos[index] = videos[index].copyWith(
          likes: videos[index].likes - 1,
          isLiked: false,
        );
      }
    } else {
      likedVideos.add(videoId);
      final index = videos.indexWhere((video) => video.id == videoId);
      if (index != -1) {
        videos[index] = videos[index].copyWith(
          likes: videos[index].likes + 1,
          isLiked: true,
        );
      }
    }
    notifyListeners();
  }

  void toggleFollow(String username) {
    if (followingUsers.contains(username)) {
      followingUsers.remove(username);
    } else {
      followingUsers.add(username);
    }

    // Actualizar todos los videos del usuario
    for (int i = 0; i < videos.length; i++) {
      if (videos[i].username == username) {
        videos[i] = videos[i].copyWith(
          isFollowing: followingUsers.contains(username),
        );
      }
    }
    notifyListeners();
  }

  void incrementViews(String videoId) {
    final index = videos.indexWhere((video) => video.id == videoId);
    if (index != -1) {
      videos[index] = videos[index].copyWith(views: videos[index].views + 1);
      notifyListeners();
    }
  }

  void incrementShares(String videoId) {
    final index = videos.indexWhere((video) => video.id == videoId);
    if (index != -1) {
      videos[index] = videos[index].copyWith(shares: videos[index].shares + 1);
      notifyListeners();
    }
  }

  void incrementComments(String videoId) {
    final index = videos.indexWhere((video) => video.id == videoId);
    if (index != -1) {
      videos[index] = videos[index].copyWith(
        comments: videos[index].comments + 1,
      );
      notifyListeners();
    }
  }

  bool isLiked(String videoId) {
    return likedVideos.contains(videoId);
  }

  bool isFollowing(String username) {
    return followingUsers.contains(username);
  }

  void refreshVideos() {
    videos.clear();
    likedVideos.clear();
    followingUsers.clear();
    initialLoading = true;
    notifyListeners();
    loadNextPage();
  }
}
