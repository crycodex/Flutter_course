import 'package:app_chat/domain/entities/msg.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Msg> msgs = [
    Msg(text: "Hola", who: Who.me),
    Msg(text: "Hola", who: Who.other),
  ];

  Future<void> sendMsg(String text) async {
    if (text.isEmpty) return;

    final newMsg = Msg(text: text, who: Who.me);
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
