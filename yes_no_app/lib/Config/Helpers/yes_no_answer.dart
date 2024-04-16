// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:yes_no_app/Domain/Entities/message_entity.dart';
import 'package:yes_no_app/Infrastructure/Models/yes_no_answer_model.dart';

final class YesNoAnswer {
  final _dio = Dio();

  Future<MessageEntity> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoAnwser = YesNoAnswerModel.fromJson(response.data);
    return yesNoAnwser.toMessageEntity();
  }
}
