import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_tracker/data/model/user/user_model.dart';

class ShProvider {
  final SharedPreferences sh;

  ShProvider(this.sh);

  Future<UserModel?> getUser() async {
    try {
      var tmp = sh.getString('user');
      if (tmp != null) {
        var json = jsonDecode(tmp);
        return UserModel.fromJson(json);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> saveUser(UserModel userModel) async {
    try {
      var userSt = jsonEncode(userModel.toJson());
      await sh.setString('user', userSt);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteUser() async {
    await sh.remove('user');
  }
}
