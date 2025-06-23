import 'package:flutter/material.dart';

//PROVIDERS
import '../../providers/chat_provider.dart';
import 'package:provider/provider.dart';

//ENTITIES
import 'package:app_chat/domain/entities/msg.dart';

class MsgFieldBox extends StatelessWidget {
  const MsgFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textController = TextEditingController();
    final focusNode = FocusNode();

    return Column(
      children: [
        // Slider para seleccionar el emisor
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: colors.surfaceVariant.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.person, color: colors.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                'Emisor:',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Consumer<ChatProvider>(
                  builder: (context, chatProvider, child) {
                    return Row(
                      children: [
                        Text(
                          'Yo',
                          style: TextStyle(
                            color:
                                chatProvider.selectedSender == Who.me
                                    ? colors.primary
                                    : colors.onSurface.withOpacity(0.6),
                            fontWeight:
                                chatProvider.selectedSender == Who.me
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            value:
                                chatProvider.selectedSender == Who.me
                                    ? 0.0
                                    : 1.0,
                            onChanged: (value) {
                              chatProvider.changeSender(
                                value < 0.5 ? Who.me : Who.other,
                              );
                            },
                            divisions: 1,
                            activeColor: colors.primary,
                            inactiveColor: colors.outline,
                          ),
                        ),
                        Text(
                          'Otro',
                          style: TextStyle(
                            color:
                                chatProvider.selectedSender == Who.other
                                    ? colors.primary
                                    : colors.onSurface.withOpacity(0.6),
                            fontWeight:
                                chatProvider.selectedSender == Who.other
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Campo de texto para el mensaje
        TextFormField(
          //caracteristicas
          focusNode: focusNode,
          controller: textController,

          decoration: InputDecoration(
            hintText: 'Send a message',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: colors.outline),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: colors.primary),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                final chatProvider = context.read<ChatProvider>();
                final text = textController.text;
                textController.clear();
                chatProvider.sendMsg(text);
                focusNode.requestFocus();
              },
              icon: Icon(Icons.send, color: colors.primary),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          onFieldSubmitted: (value) {
            final chatProvider = context.read<ChatProvider>();
            final text = textController.text;
            chatProvider.sendMsg(text);
            textController.clear();
            focusNode.requestFocus();
          },
          onChanged: (value) {
            print('onChanged: $value');
          },
        ),
      ],
    );
  }
}
