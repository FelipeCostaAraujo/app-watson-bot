import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watson_chat/models/conversation.model.dart';
import 'package:watson_chat/repositories/api-repository.dart';
import 'package:watson_chat/ui/pages/conversation/conversation-presenter.dart';

import './components/components.dart';

class ConversationPage extends StatefulWidget {
  final ConversationPresenter presenter;
  ConversationPage(this.presenter);

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  ApiRepository api = new ApiRepository();

  List<ConversationModel> conversationList = [];
  List<String> inputs = [];
  String conversationContext = "";
  ConversationModel lastConversation;

  void _hideKeyBoard() {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  void initState() {
    super.initState();
    inputs.add("");
    widget.presenter.initializeConversation();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _hideKeyBoard,
      child: SafeArea(
        bottom: true,
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Chat App"),
            centerTitle: true,
            elevation:
                Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
          ),
          body: Column(
            children: <Widget>[
              Expanded(child: Builder(
                builder: (context) {
                  widget.presenter.conversationStream.listen((conversation) {
                    if (lastConversation != conversation) {
                      conversationList.add(conversation);
                    }
                  });

                  widget.presenter.lastInputStream.listen((input) {
                    inputs.add(input);
                    print(input);
                  });

                  return StreamBuilder<ConversationModel>(
                      stream: widget.presenter.conversationStream,
                      builder: (context, snapshot) {
                        print('updating stream');
                        return ListView.builder(
                            reverse: false,
                            itemCount: conversationList.length,
                            itemBuilder: (context, index) {
                              return ChatMessage(
                                  conversationList[index], inputs[index]);
                            });
                      });
                },
              )),
              Divider(
                height: 1.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: Provider(
                  create: (_) => widget.presenter,
                  child: TextComposer(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
