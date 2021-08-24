import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/data/models/user_model.dart';
import 'package:app_find_home/app/data/repositories/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final _userRepository = Get.find<UserRepository>();

  //Variables
  String _name = "";
  String _lastName = "";
  String _adress = "";
  String _email = "";
  String _password = "";

  @override
  void onInit() {
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

  void onChangeName(String value) => _name = value;
  void onChangeLastName(String value) => _lastName = value;
  void onChangeAdress(String value) => _adress = value;
  void onChangeEmail(String value) => _email = value;
  void onChangePassword(String value) => _password = value;

  save() async {
    try {
      UserModel oUser = UserModel(
        name: _name,
        lastname: _lastName,
        adress: _adress,
        email: _email,
        password: _password,
      );

      String response = await _userRepository.insertUser(userModel: oUser);
      Get.snackbar(
        "Success",
        response,
        colorText: Colors.white,
        duration: Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppTheme.cyan,
      );
    } on DioError catch (e) {
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
