import 'package:watson_chat/models/conversation.model.dart';

abstract class ConversationPresenter{
  Stream<ConversationModel> get conversationStream;
  Stream<String> get lastInputStream;
  Future<void> initializeConversation();
  Future<void> sendMessage(String input);
  String conversationContext;
}