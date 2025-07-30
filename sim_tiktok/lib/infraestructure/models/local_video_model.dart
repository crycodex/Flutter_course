import 'package:sim_tiktok/domain/entities/video_post.dart';

class LocalVideoModel {
  final String id;
  final String name;
  final String username;
  final String caption;
  final String videoUrl;
  final String? userAvatar;
  final String? musicTitle;
  final String? hashtags;
  final int likes;
  final int comments;
  final int views;
  final int shares;
  final bool isLiked;
  final bool isFollowing;
  final DateTime createdAt;
  final Duration videoDuration;

  LocalVideoModel({
    required this.id,
    required this.name,
    required this.username,
    required this.caption,
    required this.videoUrl,
    this.userAvatar,
    this.musicTitle,
    this.hashtags,
    required this.likes,
    required this.comments,
    required this.views,
    required this.shares,
    required this.isLiked,
    required this.isFollowing,
    required this.createdAt,
    required this.videoDuration,
  });

  // Factory constructor
  factory LocalVideoModel.fromJson(Map<String, dynamic> json) {
    // Parse video duration from string format "00:15" to Duration
    Duration parseDuration(String durationStr) {
      final parts = durationStr.split(':');
      final minutes = int.parse(parts[0]);
      final seconds = int.parse(parts[1]);
      return Duration(minutes: minutes, seconds: seconds);
    }

    return LocalVideoModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      caption: json['caption'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      userAvatar: json['userAvatar'],
      musicTitle: json['musicTitle'],
      hashtags: json['hashtags'],
      likes: json['likes'] ?? 0,
      comments: json['comments'] ?? 0,
      views: json['views'] ?? 0,
      shares: json['shares'] ?? 0,
      isLiked: json['isLiked'] ?? false,
      isFollowing: json['isFollowing'] ?? false,
      createdAt: DateTime.parse(
        json['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
      videoDuration: parseDuration(json['videoDuration'] ?? '00:15'),
    );
  }

  // Convert to entity
  VideoPost toVdeoPostEntity() => VideoPost(
    id: id,
    name: name,
    username: username,
    caption: caption,
    videoUrl: videoUrl,
    userAvatar: userAvatar,
    musicTitle: musicTitle,
    hashtags: hashtags,
    likes: likes,
    comments: comments,
    views: views,
    shares: shares,
    isLiked: isLiked,
    isFollowing: isFollowing,
    createdAt: createdAt,
    videoDuration: videoDuration,
  );
}
