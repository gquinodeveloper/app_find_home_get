import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/data/models/house_model.dart';
import 'package:app_find_home/app/data/models/request_token.dart';
import 'package:app_find_home/app/data/models/user_model.dart';
import 'package:app_find_home/app/data/repositories/house_repository.dart';
import 'package:app_find_home/app/data/repositories/local/storage_repository.dart';
import 'package:app_find_home/app/data/repositories/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _storageRepository = Get.find<StorageRepository>();
  final _userRepository = Get.find<UserRepository>();
  final _houseRepository = Get.find<HouseRepository>();

  RequestToken _requestToken = RequestToken();

  List<UserModel> _userModel = [];
  List<UserModel> get userModel => _userModel;

  RxList<HouseModel> _houses = RxList<HouseModel>([]);
  RxList<HouseModel> get houses => _houses;

  RxInt _isSelectedIndex = RxInt(0); //0.obs;
  RxInt get isSelectedIndex => _isSelectedIndex;

  //Variables
  RxString adress = RxString(""); //"".obs;
  RxString name = RxString("");

  @override
  void onInit() {
    _loadStorage();
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

  selectedIndex(int index) {
    isSelectedIndex.value = index;
  }

  _loadStorage() async {
    try {
      _requestToken = await _storageRepository.getSession();
      _userModel = await _userRepository.getInformation(
        token: _requestToken.requestToken ?? "",
        userID: _requestToken.idUser ?? 0,
      );

      adress.value = _userModel[0].adress ?? "No tengo valor";
      name.value = _userModel[0].name ?? "";

      _loadHouses();
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

  _loadHouses() async {
    try {
      _houses.value = await _houseRepository.getHouses(
        token: _requestToken.requestToken ?? "",
      );

      print(_houses.length);
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
