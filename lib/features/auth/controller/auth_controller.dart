import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService{
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
          String? photoUrl = auth.user?.photoURL??"";

          print("DEBUG: Apple signin success");
          print("DEBUG: id: $id, photoUrl: $photoUrl");


        }
      }
    }
    catch(e){
      print("DEBUG: handleSignIn Error $e");
    }
  }

}