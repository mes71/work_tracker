import 'package:work_tracker/data/model/user/user_model.dart';
import 'package:work_tracker/data/service/local_storage/sh/sh_provider.dart';

abstract class LocalStorage {
  Future<UserModel?> getUser();

  Future<void> storeUser(UserModel userModel);

  Future<void> deleteUser();
}

class LocalStorageImp extends LocalStorage {
  final ShProvider shProvider;

  LocalStorageImp(this.shProvider);

  @override
  Future<UserModel?> getUser() async => await shProvider.getUser();

  @override
  Future<void> storeUser(UserModel userModel) async {
    await shProvider.saveUser(userModel);
  }

  @override
  Future<void> deleteUser() async {
    await shProvider.deleteUser();
  }
}
