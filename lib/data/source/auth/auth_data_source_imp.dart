import 'package:firebase_auth/firebase_auth.dart';
import 'package:work_tracker/data/mapper/fire_base_user_to_user_model.dart';
import 'package:work_tracker/data/model/user/user_model.dart';
import 'package:work_tracker/data/service/local_storage/local_storage.dart';
import 'package:work_tracker/data/source/auth/auth_data_source.dart';

class AuthDataSourceImp extends AuthDataSource {
  final FirebaseAuth firebaseAuth;
  final LocalStorageImp sh;

  AuthDataSourceImp({required this.firebaseAuth, required this.sh});

  @override
  Future<UserModel?> getCurrentUser() async => await sh.getUser();

  @override
  Future<UserModel> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      UserModel userModel = userCredential.toUserModel;
      sh.storeUser(userModel);
      return userModel;
    } on FirebaseAuthException catch (e) {
      rethrow;
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await sh.deleteUser();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<UserModel> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel userModel = userCredential.toUserModel;
      sh.storeUser(userModel);
      return userModel;
    } catch (e) {
      throw Exception(e);
    }
  }
}
