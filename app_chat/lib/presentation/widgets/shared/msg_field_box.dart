import 'package:flutter/material.dart';

class MsgFieldBox extends StatelessWidget {
  const MsgFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textController = TextEditingController();
    final focusNode = FocusNode();

    return TextFormField(
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
            final text = textController.text;
            textController.clear();
            print('send: $text');
            focusNode.requestFocus();
          },
          icon: Icon(Icons.send, color: colors.primary),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onFieldSubmitted: (value) {
        print('onFieldSubmitted: $value');
        textController.clear();
        focusNode.requestFocus();
      },
      onChanged: (value) {
        print('onChanged: $value');
      },
    );
  }
}
