import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/Domain/Entities/message_entity.dart';
import 'package:yes_no_app/Presentation/Providers/chat_provider.dart';
import 'package:yes_no_app/Presentation/Widgets/Chat/her_message_bubble.dart';
import 'package:yes_no_app/Presentation/Widgets/Chat/my_message_bubble.dart';
import 'package:yes_no_app/Presentation/Widgets/Shared/message_field_box.dart';

final class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jhonny 🏴‍☠️'),
        leading: const Padding(
          padding: EdgeInsets.all(3),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/564x/05/13/64/051364959f28400a106c55481005854d.jpg'),
          ),
        ),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

final class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.scrollController,
              itemCount: chatProvider.messages.length,
              itemBuilder: (_, index) {
                final message = chatProvider.messages[index];
                return message.fromWho == FromWho.mine
                    ? MyMessageBubble(message: message)
                    : HerMessageBubble(message: message);
              },
            )),
            MessageFieldBox(
                onChange: (text) => chatProvider.sendMessage(text: text))
          ],
        ),
      ),
    );
  }
}
