import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:watson_chat/models/conversation.model.dart';

class BotMessage extends StatelessWidget {
  final ConversationModel data;
  BotMessage(this.data);

  final String formattedDate = DateFormat('kk:mm').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://png.pngtree.com/png-clipart/20190924/original/pngtree-businessman-user-avatar-free-vector-png-image_4827807.jpg"),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data.output.generic[0].text,
                  style: Theme.of(context).textTheme.subhead,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(formattedDate.toString())
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
