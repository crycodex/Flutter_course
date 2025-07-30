class VideoPost {
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

  VideoPost({
    required this.id,
    required this.name,
    required this.username,
    required this.caption,
    required this.videoUrl,
    this.userAvatar,
    this.musicTitle,
    this.hashtags,
    this.likes = 0,
    this.comments = 0,
    this.views = 0,
    this.shares = 0,
    this.isLiked = false,
    this.isFollowing = false,
    required this.createdAt,
    required this.videoDuration,
  });

  VideoPost copyWith({
    String? id,
    String? name,
    String? username,
    String? caption,
    String? videoUrl,
    String? userAvatar,
    String? musicTitle,
    String? hashtags,
    int? likes,
    int? comments,
    int? views,
    int? shares,
    bool? isLiked,
    bool? isFollowing,
    DateTime? createdAt,
    Duration? videoDuration,
  }) {
    return VideoPost(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      caption: caption ?? this.caption,
      videoUrl: videoUrl ?? this.videoUrl,
      userAvatar: userAvatar ?? this.userAvatar,
      musicTitle: musicTitle ?? this.musicTitle,
      hashtags: hashtags ?? this.hashtags,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      views: views ?? this.views,
      shares: shares ?? this.shares,
      isLiked: isLiked ?? this.isLiked,
      isFollowing: isFollowing ?? this.isFollowing,
      createdAt: createdAt ?? this.createdAt,
      videoDuration: videoDuration ?? this.videoDuration,
    );
  }
}
