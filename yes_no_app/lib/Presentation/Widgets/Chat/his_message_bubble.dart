import 'package:flutter/material.dart';
import 'package:yes_no_app/Domain/Entities/message_entity.dart';

final class HisMessageBubble extends StatelessWidget {
  const HisMessageBubble({super.key, required this.message});

  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                color: colors.secondary,
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                message.message,
                style: const TextStyle(color: Colors.white),
              ),
            )),
        const SizedBox(
          height: 8,
        ),
        _ImageBubble(
          image: message.image ?? '',
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}

final class _ImageBubble extends StatelessWidget {
  const _ImageBubble({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        image,
        width: size.width * 0.5,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Container(
              width: size.width * 0.5,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: const Text('Is sending an image...'),
            );
          }
        },
      ),
    );
  }
}
