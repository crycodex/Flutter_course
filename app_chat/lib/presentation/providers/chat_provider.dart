import 'package:app_chat/domain/entities/msg.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  // Nueva propiedad para seleccionar el emisor
  Who _selectedSender = Who.me;

  Who get selectedSender => _selectedSender;

  List<Msg> msgs = [
    Msg(text: "Hola", who: Who.me),
    Msg(text: "Hola", who: Who.other),
  ];

  // Método para cambiar el emisor seleccionado
  void changeSender(Who sender) {
    _selectedSender = sender;
    notifyListeners();
  }

  Future<void> sendMsg(String text) async {
    if (text.isEmpty) return;

    // Usar el emisor seleccionado en lugar de siempre Who.me
    final newMsg = Msg(text: text, who: _selectedSender);
    msgs.add(newMsg);
    moveScrollToBottom();
    notifyListeners();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
