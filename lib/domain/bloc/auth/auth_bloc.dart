import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:work_tracker/data/model/user/user_model.dart';
import 'package:work_tracker/data/source/auth/auth_data_source_imp.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthDataSourceImp dataSource;

  AuthBloc(this.dataSource) : super(const AuthInit()) {
    on<AuthStarted>(_onAuthStarted);
    on<AuthToggleModeEvent>(_onAuthToggleModeEvent);
    on<AuthSignInEvent>(_onAuthSignIn);
    on<AuthSignUpEvent>(_onAuthSignUp);
    on<AuthSignOutEvent>(_onAuthSignOut);
  }

  Future<void> _onAuthStarted(
      AuthStarted event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 1500));
      final user = await dataSource.getCurrentUser();
      if (user != null) {
        emit(Authenticated(user: user));
      } else {
        emit(const Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  FutureOr<void> _onAuthToggleModeEvent(
      AuthToggleModeEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(isLoginMode: !state.isLoginMode));
  }

  FutureOr<void> _onAuthSignOut(
      AuthSignOutEvent event, Emitter<AuthState> emit) async {
    try {
      emit(const AuthLoading());
      await dataSource.signOut();
    } catch (e) {
      emit(const AuthError(message: 'Error Try again'));
    }
  }

  FutureOr<void> _onAuthSignIn(
      AuthSignInEvent event, Emitter<AuthState> emit) async {
    try {
      emit(const AuthLoading());
      await dataSource.signIn(event.email, event.password);
    } on FirebaseAuthException catch (e) {
      emit(AuthError(message: e.message ?? 'Essrror Try again'));
    } on Exception catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  FutureOr<void> _onAuthSignUp(
      AuthSignUpEvent event, Emitter<AuthState> emit) async {
    try {
      emit(const AuthLoading());
      await dataSource.signUp(event.email, event.password);
    } catch (e) {
      emit(const AuthError(message: 'Error Try again'));
    }
  }
}
