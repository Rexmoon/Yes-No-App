import 'package:flutter/material.dart';
import 'package:yes_no_app/Domain/Entities/message_entity.dart';

final class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key, required this.message});

  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                color: colors.primary, borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                message.message,
                style: const TextStyle(color: Colors.white),
              ),
            )),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
