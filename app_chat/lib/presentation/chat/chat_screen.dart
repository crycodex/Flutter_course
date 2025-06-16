import 'package:flutter/material.dart';

//WIDGETS
import '../widgets/chats/msg_bubble.dart';
import '../widgets/chats/other_msg_bubble.dart';
import '../widgets/shared/msg_field_box.dart';

//PROVIDERS
import '../providers/chat_provider.dart';
import 'package:provider/provider.dart';

//ENTITIES
import 'package:app_chat/domain/entities/msg.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App Simulator'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: false,
        titleSpacing: 0,
        toolbarHeight: 50,
        backgroundColor: Colors.grey,
      ),
      body: _ChatBody(),
    );
  }
}

class _ChatBody extends StatelessWidget {
  _ChatBody();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    final msgs = chatProvider.msgs;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: msgs.length,
                itemBuilder: (context, index) {
                  final msg = msgs[index];
                  return (msg.who == Who.me)
                      ? MsgBubble(msg: msg, date: msg.date.toLocal())
                      : OtherMsgBubble(msg: msg, date: msg.date.toLocal());
                },
              ),
            ),
            MsgFieldBox(),
          ],
        ),
      ),
    );
  }
}
