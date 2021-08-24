import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/data/models/request_token.dart';
import 'package:app_find_home/app/data/repositories/authentication_repository.dart';
import 'package:app_find_home/app/data/repositories/local/storage_repository.dart';
import 'package:app_find_home/app/global_widgets/load_spinner.dart';
import 'package:app_find_home/app/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //Repository
  final _authRepository = Get.find<AuthenticationRepository>();
  final _storageRepository = Get.find<StorageRepository>();

  //Variables
  String _email = "gqcrispin@gmail.com";
  String _password = "123456";

  RequestToken _oRequestToken = RequestToken();

  @override
  void onInit() {
    _authAutomatic();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void onChangeEmail(String value) => _email = value;

  void onChangePassword(String value) => _password = value;

  _authAutomatic() {}

  auth() async {
    try {
      LoadSpinner.show();
      _oRequestToken = await _authRepository.authentication(
        email: _email,
        password: _password,
      );

      if (_oRequestToken.success == true) {
        _storageRepository.setSession(requestToken: _oRequestToken);
        Get.offNamedUntil(AppRoutes.HOME, (_) => false);
      }

      print(_oRequestToken.requestToken);
    } on DioError catch (e) {
      LoadSpinner.hide();
      Get.snackbar(
        "Message",
        e.response?.data["message"],
        colorText: Colors.white,
        duration: Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppTheme.cyan,
      );
    }
  }
}
