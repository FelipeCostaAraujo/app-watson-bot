import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserMessage extends StatelessWidget {

  final String text;

  UserMessage(this.text);

  final String formattedDate = DateFormat('kk:mm').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://scontent-gru2-1.xx.fbcdn.net/v/t1.0-9/43952819_2362488520433061_6366128773854658560_o.jpg?_nc_cat=107&ccb=3&_nc_sid=174925&_nc_eui2=AeFWiNZg-NxrwLaxWc89iNVUCVsCU6d4-DAJWwJTp3j4MGAE_NRZB98KCTGjWFy0z5wpwx7hw3i3neCQ0u49oajH&_nc_ohc=woAOMDsgwzUAX-ENVe0&_nc_ht=scontent-gru2-1.xx&oh=56f20e5f35eef118d9f37814cc9e8d38&oe=6053D610"),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(text, style: Theme.of(context).textTheme.subhead),
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




