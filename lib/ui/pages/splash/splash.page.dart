import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watson_chat/ui/pages/splash/splash.presenter.dart';

import '../../components/component.dart';

import './splash.dart';

class SplashPage extends StatelessWidget {
  final SplashPresenter presenter;
  SplashPage({@required this.presenter});

  @override
  Widget build(BuildContext context) {
    presenter.checkAccount();

    return Scaffold(
      body: Builder(
          builder: (context){
            presenter.navigateToStream.listen((page) {
              if (page?.isNotEmpty == true) {
                Get.offAllNamed(page);
              }
            });
            return flareLoading(context);
          }
      ),
    );
  }
}