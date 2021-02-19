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
    final double height = MediaQuery.of(context).size.height * 0.3;
    final double width = MediaQuery.of(context).size.width * 0.3;

    return Scaffold(
      body: Builder(
          builder: (context){
            presenter.navigateToStream.listen((page) {
              if (page?.isNotEmpty == true) {
                Get.offAllNamed(page);
              }
            });
            return Center(
              child: Container(
                  height: height,
                  width: width,
                  child: flareLoading()
              ),
            );
          }
      ),
    );
  }
}