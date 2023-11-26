import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:thibiti/global.dart';
import 'package:thibiti/routes/route_helper.dart';
import 'package:thibiti/utils/app_constants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../model/login_request_model.dart';
import '../repo/auth_repo.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;
  AuthController({
    required this.authRepo
  });

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  signInWithApple() async{
    final appleProvider = AppleAuthProvider();
    return await _firebaseAuth.signInWithProvider(appleProvider);
  }

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    return googleUser;
  }


    handleSignIn(String type) async {
    try{
      if(type=="google"){
        GoogleSignInAccount? user = await signInWithGoogle();
        if(user != null){
          String? displayName = user.displayName;
          String? email = user.email;
          String? id = user.id;
          String? photoUrl = user.photoUrl??"https://static-00.iconduck.com/assets.00/user-avatar-icon-2048x2048-wpp8os2d.png";

          LoginRequestModel loginModel = LoginRequestModel();
          loginModel.avatar = photoUrl;
          loginModel.name = displayName;
          loginModel.email = email;
          loginModel.openId = id;
          loginModel.userType = "C";
          loginModel.type = 2; /// type 2 means google login

          await asyncPostAllData(loginModel);

          print("DEBUG: Google signin success");

          ///Navigate to homepage
          Get.offNamed(RouteHelper.getHomePage());
        }
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
          loginModel.type = 4; /// type 4 means apple login


          await asyncPostAllData(loginModel);

          print("DEBUG: Apple signin success");

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

  void logout() {
    // LoginRequestModel userModel = getUserObjectFromSP();
    // if(userModel.type==4){
    // }
    _firebaseAuth.signOut();
    Global.spStorage.clearStorage();
    Get.offNamed(RouteHelper.getLoginPage());
  }

}