import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_tracker/data/service/local_storage/local_storage.dart';
import 'package:work_tracker/data/service/local_storage/sh/sh_provider.dart';
import 'package:work_tracker/data/source/auth/auth_data_source_imp.dart';

final di = GetIt.instance;

Future<void> setupDi() async {
  //local Storage
  di.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  di.registerFactory<ShProvider>(() => ShProvider(di<SharedPreferences>()));
  di.registerFactory<LocalStorageImp>(() => LocalStorageImp(di<ShProvider>()));

  //auth data source
  di.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  di.registerFactory<AuthDataSourceImp>(() => AuthDataSourceImp(
      firebaseAuth: di<FirebaseAuth>(), sh: di<LocalStorageImp>()));
}
