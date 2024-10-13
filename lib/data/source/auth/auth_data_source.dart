import 'package:work_tracker/data/model/user/user_model.dart';

abstract class AuthDataSource {
  Future<UserModel> signIn(String email, String password);

  Future<UserModel> signUp(String email, String password);

  Future<void> signOut();

  Future<UserModel> getCurrentUser();
}
