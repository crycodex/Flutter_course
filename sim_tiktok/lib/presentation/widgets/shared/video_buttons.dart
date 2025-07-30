import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sim_tiktok/domain/entities/video_post.dart';
import 'package:sim_tiktok/config/helpers/num_format.dart';
import 'package:sim_tiktok/presentation/providers/discover_provider.dart';

class VideoButtons extends StatefulWidget {
  final VideoPost videoPost;

  const VideoButtons({super.key, required this.videoPost});

  @override
  State<VideoButtons> createState() => _VideoButtonsState();
}

class _VideoButtonsState extends State<VideoButtons>
    with TickerProviderStateMixin {
  late AnimationController _likeController;
  late AnimationController _shareController;
  late AnimationController _commentController;
  bool _isLiked = false;
  bool _showLikeAnimation = false;

  @override
  void initState() {
    super.initState();
    _likeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _shareController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _commentController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _isLiked = widget.videoPost.isLiked;
  }

  @override
  void dispose() {
    _likeController.dispose();
    _shareController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _onLikePressed() {
    final provider = context.read<DiscoverProvider>();
    provider.toggleLike(widget.videoPost.id);

    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        _showLikeAnimation = true;
        _likeController.forward().then((_) {
          _likeController.reverse();
        });
      }
    });

    // Ocultar animación después de un tiempo
    if (_isLiked) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (mounted) {
          setState(() {
            _showLikeAnimation = false;
          });
        }
      });
    }
  }

  void _onCommentPressed() {
    _commentController.forward().then((_) {
      _commentController.reverse();
    });
    _showCommentDialog();
  }

  void _onSharePressed() {
    _shareController.forward().then((_) {
      _shareController.reverse();
    });
    _showShareDialog();
  }

  void _showCommentDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => _CommentDialog(videoPost: widget.videoPost),
    );
  }

  void _showShareDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _ShareDialog(videoPost: widget.videoPost),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Botón de like
        Stack(
          children: [
            _CustomIcon(
              value: widget.videoPost.likes,
              icon: _isLiked ? Icons.favorite : Icons.favorite_border_outlined,
              color: _isLiked ? Colors.red : Colors.white,
              onPressed: _onLikePressed,
              animationController: _likeController,
            ),
            if (_showLikeAnimation)
              Positioned.fill(
                child: ScaleTransition(
                  scale: _likeController,
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 60,
                  ),
                ),
              ),
          ],
        ),

        const SizedBox(height: 10),

        // Botón de comentarios
        _CustomIcon(
          value: widget.videoPost.comments,
          icon: Icons.chat_bubble_outline_outlined,
          color: Colors.white,
          onPressed: _onCommentPressed,
          animationController: _commentController,
        ),

        const SizedBox(height: 10),

        // Botón de compartir
        _CustomIcon(
          value: widget.videoPost.shares,
          icon: Icons.share_outlined,
          color: Colors.white,
          onPressed: _onSharePressed,
          animationController: _shareController,
        ),

        const SizedBox(height: 10),

        // Botón de vistas
        _CustomIcon(
          value: widget.videoPost.views,
          icon: Icons.remove_red_eye_outlined,
          color: Colors.white,
          onPressed: () {},
        ),

        const SizedBox(height: 10),

        // Botón de música giratorio
        SpinPerfect(
          infinite: true,
          duration: const Duration(milliseconds: 3000),
          child: _CustomIcon(
            value: 0,
            icon: Icons.play_circle_outline,
            color: Colors.white,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class _CustomIcon extends StatelessWidget {
  final int value;
  final IconData icon;
  final Color? color;
  final VoidCallback? onPressed;
  final AnimationController? animationController;

  const _CustomIcon({
    required this.value,
    required this.icon,
    this.color,
    this.onPressed,
    this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: AnimatedBuilder(
            animation: animationController ?? const AlwaysStoppedAnimation(0),
            builder: (context, child) {
              return Transform.scale(
                scale: animationController?.value ?? 1.0,
                child: Icon(icon, color: color ?? Colors.white, size: 25),
              );
            },
          ),
        ),
        if (value > 0)
          Text(
            NumFormat.numberFormat(value.toDouble()),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}

class _CommentDialog extends StatefulWidget {
  final VideoPost videoPost;

  const _CommentDialog({required this.videoPost});

  @override
  State<_CommentDialog> createState() => _CommentDialogState();
}

class _CommentDialogState extends State<_CommentDialog> {
  final TextEditingController _commentController = TextEditingController();
  final List<String> _comments = [
    '¡Muy buen video! 🔥',
    'Me encanta este contenido 😍',
    'Sigue así 💪',
    'Increíble trabajo 👏',
    'Me gustó mucho 👍',
  ];

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _addComment() {
    if (_commentController.text.trim().isNotEmpty) {
      setState(() {
        _comments.insert(0, _commentController.text.trim());
      });
      _commentController.clear();
      context.read<DiscoverProvider>().incrementComments(widget.videoPost.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: Row(
              children: [
                const Text(
                  'Comentarios',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),

          // Lista de comentarios
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.grey[300],
                        child: Text(
                          'U${index + 1}',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Usuario${index + 1}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _comments[index],
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Input para nuevo comentario
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: const InputDecoration(
                      hintText: 'Agregar comentario...',
                      border: InputBorder.none,
                    ),
                    onSubmitted: (_) => _addComment(),
                  ),
                ),
                IconButton(
                  onPressed: _addComment,
                  icon: const Icon(Icons.send),
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ShareDialog extends StatelessWidget {
  final VideoPost videoPost;

  const _ShareDialog({required this.videoPost});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: Row(
              children: [
                const Text(
                  'Compartir',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),

          // Opciones de compartir
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _ShareOption(
                  icon: Icons.copy,
                  label: 'Copiar',
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Enlace copiado')),
                    );
                  },
                ),
                _ShareOption(
                  icon: Icons.share,
                  label: 'Compartir',
                  onTap: () {
                    Navigator.pop(context);
                    context.read<DiscoverProvider>().incrementShares(
                      videoPost.id,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Video compartido')),
                    );
                  },
                ),
                _ShareOption(
                  icon: Icons.download,
                  label: 'Descargar',
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Descarga iniciada')),
                    );
                  },
                ),
                _ShareOption(
                  icon: Icons.report,
                  label: 'Reportar',
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Reporte enviado')),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ShareOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ShareOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(icon, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
