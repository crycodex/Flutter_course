import 'package:flutter/material.dart';
import 'package:sim_tiktok/domain/entities/video_post.dart';
import 'package:sim_tiktok/config/helpers/num_format.dart';

class VideoStats extends StatelessWidget {
  final VideoPost videoPost;
  final bool showDetailed;

  const VideoStats({
    super.key,
    required this.videoPost,
    this.showDetailed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildStatRow('Likes', videoPost.likes, Icons.favorite, Colors.red),
          const SizedBox(height: 8),
          _buildStatRow(
            'Comentarios',
            videoPost.comments,
            Icons.chat_bubble,
            Colors.blue,
          ),
          const SizedBox(height: 8),
          _buildStatRow(
            'Vistas',
            videoPost.views,
            Icons.remove_red_eye,
            Colors.green,
          ),
          const SizedBox(height: 8),
          _buildStatRow(
            'Compartidos',
            videoPost.shares,
            Icons.share,
            Colors.orange,
          ),

          if (showDetailed) ...[
            const SizedBox(height: 12),
            const Divider(color: Colors.white24, height: 1),
            const SizedBox(height: 8),
            _buildDetailRow(
              'Duración',
              _formatDuration(videoPost.videoDuration),
            ),
            const SizedBox(height: 4),
            _buildDetailRow('Fecha', _formatDate(videoPost.createdAt)),
            if (videoPost.musicTitle != null) ...[
              const SizedBox(height: 4),
              _buildDetailRow('Música', videoPost.musicTitle!),
            ],
          ],
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, int value, IconData icon, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        const Spacer(),
        Text(
          NumFormat.numberFormat(value.toDouble()),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      children: [
        Text(
          '$label:',
          style: const TextStyle(color: Colors.white70, fontSize: 11),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 11),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return 'Hace ${difference.inDays} día${difference.inDays > 1 ? 's' : ''}';
    } else if (difference.inHours > 0) {
      return 'Hace ${difference.inHours} hora${difference.inHours > 1 ? 's' : ''}';
    } else if (difference.inMinutes > 0) {
      return 'Hace ${difference.inMinutes} minuto${difference.inMinutes > 1 ? 's' : ''}';
    } else {
      return 'Ahora mismo';
    }
  }
}

class VideoStatsOverlay extends StatefulWidget {
  final VideoPost videoPost;

  const VideoStatsOverlay({super.key, required this.videoPost});

  @override
  State<VideoStatsOverlay> createState() => _VideoStatsOverlayState();
}

class _VideoStatsOverlayState extends State<VideoStatsOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool _showDetailed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleDetailed() {
    setState(() {
      _showDetailed = !_showDetailed;
    });
    if (_showDetailed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      right: 20,
      child: GestureDetector(
        onTap: _toggleDetailed,
        child: AnimatedBuilder(
          animation: _fadeAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeAnimation.value,
              child: VideoStats(
                videoPost: widget.videoPost,
                showDetailed: _showDetailed,
              ),
            );
          },
        ),
      ),
    );
  }
}
