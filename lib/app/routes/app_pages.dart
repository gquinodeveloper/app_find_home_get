import 'package:app_find_home/app/modules/login/login_binding.dart';
import 'package:app_find_home/app/modules/login/login_page.dart';
import 'package:app_find_home/app/modules/splash/splash_binding.dart';
import 'package:app_find_home/app/modules/splash/splash_page.dart';
import 'package:app_find_home/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
