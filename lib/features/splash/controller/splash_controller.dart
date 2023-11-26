import 'package:get/get.dart';
import 'package:thibiti/features/auth/controller/auth_controller.dart';
import 'package:thibiti/features/splash/repo/splash_repo.dart';
import 'package:thibiti/routes/route_helper.dart';

class SplashController extends GetxController implements GetxService{
  final SplashRepo splashRepo;

  SplashController({
    required this.splashRepo
  });

  checkIsLoggedIn(){
    Future.delayed(Duration(seconds: 1), (){
      bool isLoggedIn = splashRepo.checkIsLoggedIn();
      print("DEBUG: isLoggedIn: $isLoggedIn ");
      if(isLoggedIn){
        Get.offNamed(RouteHelper.getHomePage());
      }
      else{
        Get.offNamed(RouteHelper.getLoginPage());
      }
    });

  }
}