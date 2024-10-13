import 'package:firebase_core/firebase_core.dart';
import 'package:work_tracker/data/model/user/user_model.dart';
import 'package:work_tracker/data/source/auth/auth_data_source.dart';

class AuthDataSourceImp extends AuthDataSource {
  final Firebase firebase;

  AuthDataSourceImp(this.firebase);

  @override
  Future<UserModel> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUp(String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
