import 'package:watson_chat/models/conversation.model.dart';
import 'package:watson_chat/settings.dart';

import 'package:dio/dio.dart';

class ApiRepository{
  final String url = Settings.url;

  Future<ConversationModel> initializeConversation() async{
    try {
      Response response = await Dio().get(url);
      return ConversationModel.fromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ConversationModel> sendMessage(String input, ConversationModel model) async {
    model.input.text = input;
    try {
      Response response = await Dio().post(url,data: model);
      return ConversationModel.fromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

}