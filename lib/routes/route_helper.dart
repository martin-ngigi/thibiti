import 'package:get/get.dart';
import 'package:thibiti/features/auth/login.dart';
import 'package:thibiti/features/home/view/home_page.dart';
import 'package:thibiti/features/splash/view/splash_view.dart';

class RouteHelper{
  static const String splashPage = '/splash-page';
  static const String loginPage = '/login-page';
  static const String homePage = '/home-page';

  static String getSplashPage() => '$splashPage';
  static String getLoginPage() => '$loginPage';
  static String getHomePage() => '$homePage';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: (){
      return SplashPage();
    }),

    GetPage(name: loginPage, page: (){
      return LoginPage();
    },
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 500)
    ),

    GetPage(name: homePage, page: (){
      return HomePage();
    },
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 500)
    ),
  ];
}