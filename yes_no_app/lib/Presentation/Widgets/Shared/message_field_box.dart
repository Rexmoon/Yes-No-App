import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key, required this.onChange});

  final ValueChanged<String> onChange;

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;
    final TextEditingController textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    final OutlineInputBorder outlineBorder = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.circular(36));

    final InputDecoration inputDecoration = InputDecoration(
        hintText: 'Type a message...',
        enabledBorder: outlineBorder,
        focusedBorder: outlineBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            onChange(textController.text);
            focusNode.requestFocus();
          },
        ));

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      keyboardAppearance: Brightness.dark,
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onChange(value);
        focusNode.requestFocus();
      },
    );
  }
}
