import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:watson_chat/presentation/getx_conversation_presentation.dart';
import 'package:watson_chat/presentation/getx_splash_presentation.dart';
import 'package:watson_chat/repositories/api-repository.dart';
import 'package:watson_chat/themes/themes.dart';
import 'package:watson_chat/ui/pages/conversation/conversation-presenter.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import './ui/pages/pages.dart';

void main() async{
  Provider.debugCheckInvalidValueType = null;
  await DotEnv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final appdata = GetStorage();


  @override
  Widget build(BuildContext context) {
    appdata.writeIfNull('darkmode', false);
    bool isDarkMode = appdata.read('darkmode');
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    return GetMaterialApp(
      title: "Watson Chatbot",
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: makeSplashPage, transition: Transition.fade),
        GetPage(name: '/conversation', page: makeConversationPage, transition: Transition.fadeIn),
      ],
    );
  }
}

Widget makeSplashPage(){
  return SplashPage(presenter: makeGetXSplashPresenter());
}

SplashPresenter makeGetXSplashPresenter(){
  return GetXSplashPresenter();
}

Widget makeConversationPage(){
  return ConversationPage(makeGetXConversationPresenter());
}

ConversationPresenter makeGetXConversationPresenter(){
  ApiRepository api = ApiRepository();
  return GetXConversationPresenter(
      api: api,
  );
}
