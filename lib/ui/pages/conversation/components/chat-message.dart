import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:watson_chat/models/conversation.model.dart';
import 'package:watson_chat/ui/pages/conversation/components/bot-message.dart';
import 'package:watson_chat/ui/pages/conversation/components/user-message.dart';

class ChatMessage extends StatelessWidget {

  final ConversationModel data;
  final String input;

  ChatMessage(this.data,this.input);

  final String formattedDate = DateFormat('kk:mm').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        input.isEmpty ? Container() : UserMessage(input),
        BotMessage(data)
      ],
    );
  }
}




