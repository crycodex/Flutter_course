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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: colors.surface.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 12),
              Text('Emisor'),
              const SizedBox(width: 12),
              Expanded(
                child: Consumer<ChatProvider>(
                  builder: (context, chatProvider, child) {
                    return Row(
                      children: [
                        Text(
                          "Yo",
                          style: TextStyle(
                            color:
                                chatProvider.selectedSender == Who.me
                                    ? colors.onSurface
                                    : colors.primary,
                            fontSize: 16,
                            fontWeight:
                                chatProvider.selectedSender == Who.me
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            value:
                                chatProvider.selectedSender == Who.me ? 1 : 0,
                            onChanged: (value) {
                              chatProvider.changeSender(
                                value == 1 ? Who.me : Who.other,
                              );
                            },
                          ),
                        ),
                        Text(
                          "El otro",
                          style: TextStyle(
                            color:
                                chatProvider.selectedSender == Who.other
                                    ? colors.onSurface
                                    : colors.primary,
                            fontSize: 16,
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
