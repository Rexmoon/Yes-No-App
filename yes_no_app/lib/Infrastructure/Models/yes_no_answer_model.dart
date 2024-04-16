import 'dart:convert';

import 'package:yes_no_app/Domain/Entities/message_entity.dart';

YesNoAnswerModel yesNoAnswerModelFromJson(String str) =>
    YesNoAnswerModel.fromJson(json.decode(str));

String yesNoAnswerModelToJson(YesNoAnswerModel data) =>
    json.encode(data.toJson());

final class YesNoAnswerModel {
  String answer;
  bool forced;
  String image;

  YesNoAnswerModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoAnswerModel.fromJson(Map<String, dynamic> json) =>
      YesNoAnswerModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  MessageEntity toMessageEntity() => MessageEntity(
      message: answer, fromWho: FromWho.his, forced: forced, image: image);
}
