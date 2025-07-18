import 'package:sim_tiktok/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String caption;
  final String videoUrl;
  final int likes;
  final int comments;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.caption,
    required this.videoUrl,
    required this.likes,
    required this.comments,
    required this.views,
  });

  //factory
  factory LocalVideoModel.fromJson(Map<String, dynamic> json) => LocalVideoModel(
    name: json['name'], 
    caption: json['caption'], 
    videoUrl: json['videoUrl'], 
    likes: json['likes'] ?? 0, 
    comments: json['comments'] ?? 0, 
    views: json['views'] ?? 0,
  );

  //entidad
  VideoPost toVdeoPostEntity() => VideoPost(
    caption: caption,
    videoUrl: videoUrl,
    likes: likes,
    comments: comments,
    views: views,
  );
}