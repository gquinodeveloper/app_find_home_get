import 'dart:convert';

import 'package:app_find_home/app/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserProvider {
  String _basePath = "https://api-reservation-flutter.herokuapp.com/";

  Future<String> insertUser({
    required UserModel userModel,
  }) async {
    final _dio = Dio();
    final response = await _dio.post(
      _basePath + "api/user/register",
      data: json.encode(userModel.toJson()),
    );
    return response.data["message"];
  }

  Future<List<UserModel>> getInformation({
    required String token,
    required int userID,
    String? opcional,
  }) async {
    final _dio = Dio();
    Map<String, dynamic> header = {
      "auth": token,
    };
    final response = await _dio.get(
      _basePath + "api/user/information/$userID",
      options: Options(
        headers: header,
      ),
      queryParameters: {
        "id": userID,
      },
    );

    return (response.data["information"] as List)
        .map((item) => UserModel.fromJson(item))
        .toList();

    //print(response);
    //return UserModel.fromJson(response.data["information"]);
  }
}
