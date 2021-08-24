import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;

import 'package:app_find_home/app/data/models/request_token.dart';
import 'package:app_find_home/app/data/providers/authentication_provider.dart';

class AuthenticationRepository {
  final _apiProvider = Get.find<AuthenticationProvider>();

  Future<RequestToken> authentication({
    @required String? email,
    @required String? password,
  }) =>
      _apiProvider.authentication(email: email, password: password);
}
