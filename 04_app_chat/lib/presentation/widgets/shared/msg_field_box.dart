import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//PROVIDERS
import '../../providers/chat_provider.dart';
import 'package:provider/provider.dart';

//ENTITIES
import 'package:app_chat/domain/entities/msg.dart';

class MsgFieldBox extends StatefulWidget {
  const MsgFieldBox({super.key});

  @override
  State<MsgFieldBox> createState() => _MsgFieldBoxState();
}

class _MsgFieldBoxState extends State<MsgFieldBox>
    with TickerProviderStateMixin {
  late TextEditingController textController;
  late FocusNode focusNode;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  bool _showUserSelector =
      false; // Variable para controlar la visibilidad del selector

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    focusNode = FocusNode();

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
    );

    // Inicializar con el selector visible
    _slideController.forward();

    // Animación de pulso cuando el campo está enfocado
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        _pulseController.repeat(reverse: true);
      } else {
        _pulseController.stop();
        _pulseController.reset();
      }
    });
  }

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    _pulseController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _toggleUserSelector() {
    setState(() {
      _showUserSelector = !_showUserSelector;
      if (_showUserSelector) {
        _slideController.forward();
      } else {
        _slideController.reverse();
      }
    });
    HapticFeedback.lightImpact();
  }

  void _sendMessage() {
    final chatProvider = context.read<ChatProvider>();
    final text = textController.text.trim();

    if (text.isNotEmpty) {
      HapticFeedback.lightImpact();
      chatProvider.sendMsg(text);
      textController.clear();
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        // Botón para mostrar/ocultar selector
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _toggleUserSelector,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedRotation(
                        duration: const Duration(milliseconds: 200),
                        turns: _showUserSelector ? 0 : 0.5,
                        child: Icon(
                          Icons.keyboard_arrow_up_rounded,
                          size: 20,
                          color:
                              _showUserSelector
                                  ? colors.primary
                                  : colors.outline,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _showUserSelector
                            ? 'Ocultar selector'
                            : 'Mostrar selector',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color:
                              _showUserSelector
                                  ? colors.primary
                                  : colors.outline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Selector de usuario mejorado (con animación)
        SlideTransition(
          position: _slideAnimation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _showUserSelector ? null : 0,
            child:
                _showUserSelector
                    ? Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            colors.primaryContainer.withOpacity(0.3),
                            colors.secondaryContainer.withOpacity(0.2),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: colors.outline.withOpacity(0.3),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: colors.primary.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: colors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.person_rounded,
                              color: colors.primary,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Enviar como:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: colors.onSurface,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Consumer<ChatProvider>(
                              builder: (context, chatProvider, child) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: colors.surface,
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: colors.outline.withOpacity(0.3),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      // Botón "Yo"
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            HapticFeedback.selectionClick();
                                            chatProvider.changeSender(Who.me);
                                          },
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                              milliseconds: 200,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  chatProvider.selectedSender ==
                                                          Who.me
                                                      ? colors.primary
                                                      : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              '👤 Yo',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color:
                                                    chatProvider.selectedSender ==
                                                            Who.me
                                                        ? Colors.white
                                                        : colors.onSurface
                                                            .withOpacity(0.7),
                                                fontSize: 14,
                                                fontWeight:
                                                    chatProvider.selectedSender ==
                                                            Who.me
                                                        ? FontWeight.w600
                                                        : FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      // Botón "Otro"
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            HapticFeedback.selectionClick();
                                            chatProvider.changeSender(
                                              Who.other,
                                            );
                                          },
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                              milliseconds: 200,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  chatProvider.selectedSender ==
                                                          Who.other
                                                      ? colors.secondary
                                                      : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              '👥 Otro',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color:
                                                    chatProvider.selectedSender ==
                                                            Who.other
                                                        ? Colors.white
                                                        : colors.onSurface
                                                            .withOpacity(0.7),
                                                fontSize: 14,
                                                fontWeight:
                                                    chatProvider.selectedSender ==
                                                            Who.other
                                                        ? FontWeight.w600
                                                        : FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                    : const SizedBox.shrink(),
          ),
        ),

        // Campo de texto mejorado
        AnimatedBuilder(
          animation: _pulseAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _pulseAnimation.value,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: colors.primary.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextFormField(
                  focusNode: focusNode,
                  controller: textController,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: '💬 Escribe un mensaje...',
                    hintStyle: TextStyle(
                      color: colors.onSurface.withOpacity(0.5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: colors.surface,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: colors.outline.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: colors.primary, width: 2),
                    ),
                    suffixIcon: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            colors.primary,
                            colors.primary.withOpacity(0.8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IconButton(
                        onPressed: _sendMessage,
                        icon: Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                  style: TextStyle(fontSize: 16, color: colors.onSurface),
                  onFieldSubmitted: (value) => _sendMessage(),
                  onChanged: (value) {
                    // Agregar vibración sutil al escribir
                    if (value.isNotEmpty && value.length % 10 == 0) {
                      HapticFeedback.selectionClick();
                    }
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
