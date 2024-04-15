enum FromWho { mine, his }

final class MessageEntity {
  final String message;
  final String? image;
  final FromWho fromWho;

  MessageEntity({required this.message, this.image, required this.fromWho});
}
