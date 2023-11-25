import 'package:get/get.dart';
import 'package:thibiti/features/auth/controller/auth_controller.dart';

Future<void> init() async{

  /// init Controllers
  Get.lazyPut(() => AuthController());
}