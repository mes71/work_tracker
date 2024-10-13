import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:work_tracker/domain/bloc/common/base_state.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInit()) {
    on<AuthStarted>(_onAuthStarted);
    on<AuthSignInEvent>(_onAuthSignIn);
    on<AuthSignUpEvent>(_onAuthSignUp);
    on<AuthSignOutEvent>(_onAuthSignOut);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _onAuthStarted(
      AuthStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = _auth.currentUser;
      if (user != null) {
        emit(Authenticated(user: user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
