import 'dart:convert';
import 'dart:ffi';

import 'package:app_find_home/app/core/config/config.dart';
import 'package:app_find_home/app/data/models/request_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;

class StorageProvider {
  final FlutterSecureStorage _storage = Get.put(FlutterSecureStorage());

  Future<void> setSession({
    @required RequestToken? requestToken,
  }) async {
    print(jsonEncode(requestToken?.toJson()));
    await _storage.write(
        key: KEY_SESSION, value: jsonEncode(requestToken!.toJson()));
  }

  Future<RequestToken> getSession() async {
    String value = await _storage.read(key: KEY_SESSION) ?? "";
    print(value);
    return RequestToken.fromJson(jsonDecode(value));
  }
}
