import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:thibiti/features/auth/controller/auth_controller.dart';
import 'package:thibiti/widgets/big_text.dart';
import 'package:thibiti/widgets/custom_button.dart';

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
          width: MediaQuery.of(context).size.width,
          // width: double.maxFinite,
          // width: Get.width,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// avatar
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   width: 1
                  // ),
                    borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: NetworkImage(authController.getUserObjectFromSP().avatar??""))
                ),
              ),

              /// Name
              BigText(text: authController.getUserObjectFromSP().name??""),

              SizedBox(height: 20,),

              /// Logout
              custom_button(
                  buttonName: "Logout",
                  onTapMethod: () async{
                    authController.logout();
                  },
                  context: context
              )
            ],
          ),
        ),
      );
    });

  }
}
