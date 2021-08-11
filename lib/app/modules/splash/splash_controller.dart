import 'package:app_find_home/app/modules/login/login_page.dart';
import 'package:app_find_home/app/routes/app_pages.dart';
import 'package:app_find_home/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    _loadLogin();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  _loadLogin() async {
    await Future.delayed(Duration(milliseconds: 800), () {
      Get.offNamed(AppRoutes.LOGIN);
      //Get.toNamed(AppRoutes.LOGIN);
      //Get.to(() => LoginPage());
    });
  }
}
