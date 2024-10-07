import 'package:bloc/bloc.dart';

class SplashCubit extends Cubit<bool> {
  SplashCubit() : super(false);

  Future<void> loadSplash() async {
    await Future.delayed(const Duration(seconds: 2))
        .then((value) => super.emit(true));
  }
}
