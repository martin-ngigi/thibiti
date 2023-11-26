import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thibiti/features/auth/controller/auth_controller.dart';
import 'package:thibiti/features/splash/controller/splash_controller.dart';
import 'package:thibiti/widgets/big_text.dart';

import '../../../routes/route_helper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initSplash();
  }

  initSplash(){
    Get.find<SplashController>().checkIsLoggedIn();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BigText(text: "Thibiti loading ..."),
      ),
    );
  }
}
