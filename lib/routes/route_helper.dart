import 'package:get/get.dart';
import 'package:thibiti/features/auth/login.dart';

class RouteHelper{
  static const String loginPage = '/login-page';

  static String getLoginPage() => '$loginPage';

  static List<GetPage> routes = [
    GetPage(name: loginPage, page: (){
      return LoginPage();
    },
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500)
    ),
  ];
}