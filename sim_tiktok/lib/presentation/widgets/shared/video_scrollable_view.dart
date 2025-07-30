import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sim_tiktok/domain/entities/video_post.dart';
import 'package:sim_tiktok/presentation/providers/discover_provider.dart';
import 'package:sim_tiktok/presentation/widgets/shared/video_buttons.dart';
import 'package:sim_tiktok/presentation/widgets/shared/video_stats.dart';
import 'package:sim_tiktok/presentation/widgets/shared/notification_badge.dart';
import 'package:sim_tiktok/presentation/widgets/shared/options_menu.dart';
import 'package:sim_tiktok/presentation/widgets/video/full_screen_player.dart';

class VideoScrollableView extends StatefulWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  State<VideoScrollableView> createState() => _VideoScrollableViewState();
}

class _VideoScrollableViewState extends State<VideoScrollableView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool _showStats = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Cargar más videos cuando estemos cerca del final
    final provider = context.read<DiscoverProvider>();
    if (index >= widget.videos.length - 2 && !provider.isLoadingMore) {
      provider.loadNextPage();
    }
  }

  void _toggleStats() {
    setState(() {
      _showStats = !_showStats;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemCount: widget.videos.length,
          onPageChanged: _onPageChanged,
          itemBuilder: (context, index) {
            final VideoPost videoPost = widget.videos[index];

            return Stack(
              children: [
                SizedBox.expand(child: FullScreenPlayer(videoPost: videoPost)),

                // Botones de acción
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: VideoButtons(videoPost: videoPost),
                ),

                // Indicador de progreso
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: _buildProgressIndicator(),
                ),

                // Botón de refresh
                Positioned(top: 50, right: 20, child: _buildRefreshButton()),

                // Botón de estadísticas
                Positioned(top: 100, left: 20, child: _buildStatsButton()),

                // Estadísticas del video
                if (_showStats) VideoStatsOverlay(videoPost: videoPost),

                // Notificaciones
                Positioned(
                  top: 150,
                  left: 20,
                  child: _buildNotificationButton(),
                ),

                // Información del video actual
                Positioned(
                  bottom: 80,
                  left: 20,
                  child: _buildCurrentVideoInfo(),
                ),

                // Menú de opciones
                const OptionsMenu(),
              ],
            );
          },
        ),

        // Indicador de carga al final
        Consumer<DiscoverProvider>(
          builder: (context, provider, child) {
            if (provider.isLoadingMore) {
              return Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Cargando más videos...',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget _buildProgressIndicator() {
    return Row(
      children: List.generate(
        widget.videos.length > 10 ? 10 : widget.videos.length,
        (index) {
          final isActive = index == _currentIndex;
          final isPast = index < _currentIndex;

          return Expanded(
            child: Container(
              height: 2,
              margin: const EdgeInsets.symmetric(horizontal: 1),
              decoration: BoxDecoration(
                color: isActive
                    ? Colors.white
                    : isPast
                    ? Colors.white.withOpacity(0.5)
                    : Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRefreshButton() {
    return Consumer<DiscoverProvider>(
      builder: (context, provider, child) {
        return GestureDetector(
          onTap: () {
            provider.refreshVideos();
            _pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.refresh, color: Colors.white, size: 20),
          ),
        );
      },
    );
  }

  Widget _buildStatsButton() {
    return GestureDetector(
      onTap: _toggleStats,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Icon(
          _showStats ? Icons.analytics : Icons.analytics_outlined,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildNotificationButton() {
    return AnimatedNotificationBadge(
      count: 3,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.notifications_outlined,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildCurrentVideoInfo() {
    final currentVideo = widget.videos[_currentIndex];
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Video ${_currentIndex + 1} de ${widget.videos.length}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '@${currentVideo.username}',
            style: const TextStyle(color: Colors.white70, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
