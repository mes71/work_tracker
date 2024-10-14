import 'package:firebase_auth/firebase_auth.dart';
import 'package:work_tracker/data/model/user/user_model.dart';

extension AppMapper on UserCredential {
  UserModel get toUserModel => UserModel(
      id: user?.uid,
      refToken: user?.refreshToken,
      email: user?.email,
      name: user?.displayName,
      photoUrl: user?.photoURL);
}
