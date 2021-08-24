import 'package:get/get.dart';
import 'package:app_find_home/app/data/providers/user_provider.dart';
import 'package:app_find_home/app/data/models/user_model.dart';

class UserRepository {
  final _apiProvider = Get.find<UserProvider>();

  Future<String> insertUser({
    required UserModel userModel,
  }) =>
      _apiProvider.insertUser(userModel: userModel);

  Future<List<UserModel>> getInformation({
    required String token,
    required int userID,
  }) =>
      _apiProvider.getInformation(token: token, userID: userID);
}
