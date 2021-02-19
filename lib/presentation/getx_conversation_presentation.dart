import 'package:get/get.dart';
import 'package:meta/meta.dart';

import 'package:watson_chat/models/conversation.model.dart';
import 'package:watson_chat/repositories/api-repository.dart';
import 'package:watson_chat/ui/pages/conversation/conversation-presenter.dart';

class GetXConversationPresenter extends GetxController implements ConversationPresenter{

  final ApiRepository api;
  GetXConversationPresenter({@required this.api});

  var chatStream = Rx<ConversationModel>();
  var lastInput = Rx<String>();

  String conversationContext = "";

  Stream<ConversationModel> get conversationStream => chatStream.stream;
  Stream<String> get lastInputStream => lastInput.stream;

  @override
  Future<void> sendMessage(String input) async{
    var conversation = await api.sendMessage(input, chatStream.value);
    lastInput.value = input;
    chatStream.value = conversation;
  }

  @override
  Future<void> initializeConversation() async{
    var conversation = await api.initializeConversation();
    conversationContext = conversation.context.conversationId;
    chatStream.value = conversation;
  }

}