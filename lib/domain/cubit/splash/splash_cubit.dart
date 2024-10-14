import 'package:bloc/bloc.dart';
import 'package:work_tracker/domain/bloc/auth/auth_bloc.dart';

class SplashCubit extends Cubit<bool> {
  final AuthBloc authBloc;

  SplashCubit(this.authBloc) : super(false);

  Future<void> loadSplash() async {
    await Future.delayed(const Duration(seconds: 2))
        .then((value) => super.emit(true));
  }
}
