import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:thibiti/features/auth/controller/auth_controller.dart';
import 'package:thibiti/widgets/big_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initHome();
  }

  initHome(){
    Get.find<AuthController>().getUserObjectFromSP();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController){
      return Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              /// avatar
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   width: 1
                  // ),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Image.network(
                    authController.getUserObjectFromSP().avatar??""
                ),
              ),

              /// Name
              BigText(text: authController.getUserObjectFromSP().name??"")
            ],
          ),
        ),
      );
    });

  }
}
