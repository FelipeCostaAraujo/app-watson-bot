import 'package:get/get.dart';
import 'package:watson_chat/ui/pages/splash/splash.dart';

class GetXSplashPresenter implements SplashPresenter{

  GetXSplashPresenter();
  var _navigateTo = RxString();

  Stream<String> get navigateToStream => _navigateTo.stream;

  Future<void> checkAccount({int durationInSeconds = 2}) async {
    await Future.delayed(Duration(seconds: durationInSeconds));
    _navigateTo.value = '/conversation';
  }

}