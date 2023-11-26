import 'package:thibiti/utils/app_constants.dart';

import '../../../global.dart';

class AuthRepo{
  saveUserObjectToSP(String userObject) {
    Global.spStorage.storeString(key: AppConstants.USER_OBJECT, value: userObject);
    Global.spStorage.storeString(key: AppConstants.ACCESS_TOKEN, value: "my access token");
  }

  getUserObjectFromSP() {
    return Global.spStorage.retrieveString(key: AppConstants.USER_OBJECT);
  }
}