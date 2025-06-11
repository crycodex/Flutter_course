import 'package:flutter/material.dart';
import 'package:get/get.dart';

//WIDGETS
import '../widgets/chats/msg_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App Simulator'),
        leading: IconButton(
          onPressed: () {
            Get.back();
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
  const _ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return MsgBubble();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
