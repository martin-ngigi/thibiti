import 'package:flutter/material.dart';
import 'package:thibiti/features/auth/controller/auth_controller.dart';
import 'package:thibiti/features/auth/login.dart';
import 'package:thibiti/global.dart';
import 'package:thibiti/routes/route_helper.dart';
import 'helper/dependencies.dart' as dep;
import 'package:get/get.dart';

Future<void> main() async {
  await Global.init();
  await dep.init();
  //Get.find<AuthController>().getUserObjectFromSP();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Thibiti app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      //home: LoginPage(),
      initialRoute: RouteHelper.getSplashPage(),
      getPages: RouteHelper.routes,
    );
  }
}

