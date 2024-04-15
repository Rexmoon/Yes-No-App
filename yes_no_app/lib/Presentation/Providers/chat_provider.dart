import 'package:flutter/material.dart';
import 'package:yes_no_app/Domain/Entities/message_entity.dart';

final class ChatProvider extends ChangeNotifier {
  final List<MessageEntity> _messages = [];
  final ScrollController _scrollController = ScrollController();

  List<MessageEntity> get messages => _messages;
  ScrollController get scrollController => _scrollController;

  Future<void> sendMessage({required String text}) async {
    if (text.isEmpty) return;
    final newMessage = MessageEntity(message: text, fromWho: FromWho.mine);
    _messages.add(newMessage);
    notifyListeners();
    await _moveScrollToBottom();
  }

  Future<void> _moveScrollToBottom() async {
    scrollController.animateTo(_scrollController.position.maxScrollExtent + 50,
        curve: Curves.easeOut, duration: const Duration(milliseconds: 400));
  }
}
