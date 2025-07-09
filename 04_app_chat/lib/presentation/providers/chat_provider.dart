import 'package:app_chat/domain/entities/msg.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  //emisor
  Who _selectedSender = Who.me;
  Who get selectedSender => _selectedSender;

  void changeSender(Who sender) {
    _selectedSender = sender;
    notifyListeners();
  }

  List<Msg> msgs = [];

  Future<void> sendMsg(String text) async {
    if (text.isEmpty) return;

    final newMsg = Msg(text: text, who: selectedSender);
    msgs.add(newMsg);
    moveScrollToBottom();
    notifyListeners();
  }

  void clearMessages() {
    msgs.clear();
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
