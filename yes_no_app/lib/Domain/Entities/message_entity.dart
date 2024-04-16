enum FromWho { mine, his }

final class MessageEntity {
  final String message;
  final String? image;
  final FromWho fromWho;
  final bool forced;

  MessageEntity(
      {required this.message,
      this.image,
      required this.fromWho,
      this.forced = false});

  MessageEntity.fromJson({required Map json})
      : message = json['answer'] ?? 'No message',
        image = json['image'],
        fromWho = FromWho.his,
        forced = json['forced'] ?? false;
}
