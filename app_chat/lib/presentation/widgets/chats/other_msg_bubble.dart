import 'package:flutter/material.dart';

//ENTITIES
import 'package:app_chat/domain/entities/msg.dart';

class OtherMsgBubble extends StatelessWidget {
  const OtherMsgBubble({super.key, required this.msg, required this.date});

  final Msg msg;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(msg.text),
              Text(date.toString(), style: TextStyle(fontSize: 8)),
            ],
          ),
        ),
      ],
    );
  }
}
