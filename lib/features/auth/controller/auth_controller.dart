import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:thibiti/global.dart';
import 'package:thibiti/routes/route_helper.dart';
import 'package:thibiti/utils/app_constants.dart';

import '../model/login_request_model.dart';
import '../repo/auth_repo.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;
  AuthController({
    required this.authRepo
  });

  signInWithApple() async{
    final appleProvider = AppleAuthProvider();
    return await FirebaseAuth.instance.signInWithProvider(appleProvider);
  }

  handleSignIn(String type) async {
    try{
      if(type=="google"){

      }
      else if(type=="phone"){

      }
      else if(type=="facebook"){

      }
      else if(type=="apple"){
        var auth =  await signInWithApple();
        if(auth.user != null){
          String? displayName = "apple_user";
          String? email = "apple@email.com";
          String? id = auth.user?.uid;
          String? photoUrl = auth.user?.photoURL??"https://static-00.iconduck.com/assets.00/user-avatar-icon-2048x2048-wpp8os2d.png";

          LoginRequestModel loginModel = LoginRequestModel();
          loginModel.avatar = photoUrl;
          loginModel.name = displayName;
          loginModel.email = email;
          loginModel.openId = id;
          loginModel.userType = "C";
          loginModel.type = 4; /// type 3 means apple login


          await asyncPostAllData(loginModel);

          print("DEBUG: Apple signin success");
          print("DEBUG: id: $id, photoUrl: $photoUrl");

          ///Navigate to homepage
          Get.offNamed(RouteHelper.getHomePage());

        }
      }
    }
    catch(e){
      print("DEBUG: handleSignIn Error $e");
    }
  }

  asyncPostAllData(LoginRequestModel loginModel) {
    String userObject = jsonEncode(loginModel.toJson());
    saveUserObjectToSP(userObject: userObject);
  }

   saveUserObjectToSP({required String userObject}) {
     authRepo.saveUserObjectToSP(userObject);
   }

   LoginRequestModel getUserObjectFromSP() {
    late LoginRequestModel _userModel;
    try {
      print("USER: ${authRepo.getUserObjectFromSP()}");
      Map<String, dynamic> user = jsonDecode(authRepo.getUserObjectFromSP());
      _userModel = LoginRequestModel.fromJson(user);
    }
    catch(e){
      print("DEBUG: getUserObjectFromSP Error $e");
    }

    return _userModel;
   }

}