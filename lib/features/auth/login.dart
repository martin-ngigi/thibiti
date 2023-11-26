import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thibiti/features/auth/controller/auth_controller.dart';
import 'package:thibiti/utils/constant_colors.dart';
import 'package:thibiti/widgets/custom_button.dart';
import 'package:thibiti/widgets/password_field.dart';
import 'package:thibiti/widgets/small_text.dart';
import 'package:thibiti/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 50,),

              /// email field
              text_field(
                  hintText: "Email",
                  icon: Icons.email,
                  textInputType: TextInputType.text,
                  maxLines: 1,
                  controller: _emailController,
                  isObsecure: false, enabled: true
              ),

              SizedBox(height: 10,),

              /// Password
              password_field(
                  hintText: "Password",
                  icon: Icons.lock_clock_rounded,
                  textInputType: TextInputType.text,
                  maxLines: 1,
                  controller: _passwordController,
                  enabled: true,
                  context: context
              ),

              SizedBox(height: 20,),

              /// Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: SmallText(text: "Forgot password ?"),
                    onTap: () async{

                    },
                  )
                ],
              ),

              SizedBox(height: 20,),

              /// Login
              custom_button(
                  buttonName: "Login",
                  onTapMethod: (){

                  },
                  context: context,

              ),

              SizedBox(height: 20,),

              /// Don\'t have an account?
              RichText(
                  text: TextSpan(
                      text: "Don\'t have an account? ",
                      style: TextStyle(
                        color: ConstantColors.textColor,
                      ),
                    children: [
                      TextSpan(
                        text: "Create",
                        style: TextStyle(
                          color: Colors.green,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {

                        }
                      )
                    ]
                  ),

              ),

              /// Divider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Divider(
                  color: ConstantColors.borderColor,
                ),
              ),
              
              SmallText(text: "Or signin with"),

              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  loginMethod(
                      type: "google",
                      icon: "assets/icons/google.png"
                  ),

                  loginMethod(
                    type: "facebook",
                    icon: "assets/icons/facebook.png",
                  ),

                  loginMethod(
                    type: "apple",
                    icon: "assets/icons/apple.png",
                  ),

                  loginMethod(
                    type: "phone",
                    icon: "assets/icons/phone.png",
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget loginMethod({required String type, required String icon}){
    return GestureDetector(
      onTap: () async{
        AuthController authController = Get.find<AuthController>();
        await authController.handleSignIn(type);
      },
      child: Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 1,
            color: ConstantColors.borderColor
          )
        ),
        child: Image.asset(icon),
      ),
    );
  }
}
