import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watson_chat/ui/pages/conversation/conversation-presenter.dart';

class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final _textController = TextEditingController();
  bool _isComposing = false;

  void _reset(){
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<ConversationPresenter>(context);
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: Theme.of(context).platform == TargetPlatform.iOS
            ? BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey[200])))
            : null,
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _textController,
                decoration:
                InputDecoration.collapsed(hintText: "Enviar uma Mensagem"),
                onChanged: (text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                onSubmitted: (text){

                  _reset();
                },
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? CupertinoButton(
                  child: Text("Enviar"),
                  onPressed: _isComposing ? () async {
                     await presenter.sendMessage(_textController.text);
                    _reset();
                  } : null,
                )
                    : IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _isComposing ? () async {
                    await presenter.sendMessage(_textController.text);
                    _reset();
                  } : null,
                ))
          ],
        ),
      ),
    );
  }
}
