import 'package:get/get.dart';
import 'package:thibiti/features/auth/controller/auth_controller.dart';
import 'package:thibiti/features/auth/repo/auth_repo.dart';

Future<void> init() async{

  /// init repos
  Get.lazyPut(() => AuthRepo());

  /// init Controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
}