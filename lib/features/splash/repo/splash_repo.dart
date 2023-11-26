import 'package:thibiti/global.dart';

class SplashRepo{
  bool checkIsLoggedIn() {
    return Global.spStorage.getIsLoggedIn();
  }

}