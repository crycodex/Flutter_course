import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sim_tiktok/presentation/providers/discover_provider.dart';

class OptionsMenu extends StatefulWidget {
  const OptionsMenu({super.key});

  @override
  State<OptionsMenu> createState() => _OptionsMenuState();
}

class _OptionsMenuState extends State<OptionsMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _isOpen = !_isOpen;
    });
    if (_isOpen) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 200,
      left: 20,
      child: Column(
        children: [
          // Botón principal
          GestureDetector(
            onTap: _toggleMenu,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: AnimatedRotation(
                turns: _isOpen ? 0.125 : 0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Opciones del menú
          AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Opacity(
                  opacity: _scaleAnimation.value,
                  child: Column(
                    children: [
                      _buildOptionButton(
                        icon: Icons.settings,
                        label: 'Configuración',
                        onTap: () => _showSettingsDialog(context),
                      ),
                      const SizedBox(height: 8),
                      _buildOptionButton(
                        icon: Icons.info_outline,
                        label: 'Acerca de',
                        onTap: () => _showAboutDialog(context),
                      ),
                      const SizedBox(height: 8),
                      _buildOptionButton(
                        icon: Icons.help_outline,
                        label: 'Ayuda',
                        onTap: () => _showHelpDialog(context),
                      ),
                      const SizedBox(height: 8),
                      _buildOptionButton(
                        icon: Icons.feedback_outlined,
                        label: 'Feedback',
                        onTap: () => _showFeedbackDialog(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 16),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Configuración'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.volume_up),
              title: Text('Volumen'),
              subtitle: Text('Ajustar volumen de videos'),
            ),
            ListTile(
              leading: Icon(Icons.play_circle_outline),
              title: Text('Reproducción automática'),
              subtitle: Text('Activar/desactivar auto-play'),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notificaciones'),
              subtitle: Text('Configurar notificaciones'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Acerca de TikTok Simulator'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Versión: 1.0.0'),
            SizedBox(height: 8),
            Text('Desarrollado con Flutter'),
            SizedBox(height: 8),
            Text('Este es un simulador educativo de TikTok'),
            SizedBox(height: 8),
            Text('Creado para aprender Flutter y desarrollo móvil'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ayuda'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('• Desliza hacia arriba/abajo para navegar'),
            SizedBox(height: 8),
            Text('• Toca el video para pausar/reproducir'),
            SizedBox(height: 8),
            Text('• Doble toque para pausar/reproducir'),
            SizedBox(height: 8),
            Text('• Usa los botones laterales para interactuar'),
            SizedBox(height: 8),
            Text('• Toca el botón de estadísticas para ver métricas'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Entendido'),
          ),
        ],
      ),
    );
  }

  void _showFeedbackDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enviar Feedback'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Escribe tu comentario...',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Feedback enviado')));
            },
            child: const Text('Enviar'),
          ),
        ],
      ),
    );
  }
}
