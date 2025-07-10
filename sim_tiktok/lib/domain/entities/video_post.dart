class VideoPost {
  final String caption;
  final String videoUrl;
  final int likes;
  final int comments;
  final int views;

  VideoPost({
    required this.caption,
    required this.videoUrl,
    this.likes = 0,
    this.comments = 0,
    this.views = 0,
  });
}