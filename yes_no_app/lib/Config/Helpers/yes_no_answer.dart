// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:yes_no_app/Domain/Entities/message_entity.dart';

final class YesNoAnswer {
  final _dio = Dio();

  Future<MessageEntity> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    return MessageEntity.fromJson(json: response.data);
  }
}
