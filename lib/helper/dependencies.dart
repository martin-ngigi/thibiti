import 'package:get/get.dart';
import 'package:thibiti/features/auth/controller/auth_controller.dart';
import 'package:thibiti/features/auth/repo/auth_repo.dart';
import 'package:thibiti/features/splash/controller/splash_controller.dart';
import 'package:thibiti/features/splash/repo/splash_repo.dart';

Future<void> init() async{

  /// init repos
  Get.lazyPut(() => SplashRepo());
  Get.lazyPut(() => AuthRepo());

  /// init Controllers
  Get.lazyPut(() => SplashController(splashRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
}