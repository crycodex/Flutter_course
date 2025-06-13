import 'package:app_chat/domain/entities/msg.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  List<Msg> msgs = [
    Msg(text: "Hola", who: Who.me),
    Msg(text: "Hola", who: Who.other),
  ];

  Future<void> sendMsg(String text) async {
    // TODO: Implementar la lógica para enviar el mensaje
  }
}
