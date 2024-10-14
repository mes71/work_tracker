part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final bool isLoginMode;

  const AuthState({this.isLoginMode = true});

  AuthState copyWith({bool? isLoginMode});

  @override
  List<Object> get props => [isLoginMode];
}

class AuthInit extends AuthState {
  const AuthInit({super.isLoginMode});

  @override
  AuthInit copyWith({bool? isLoginMode}) {
    return AuthInit(
      isLoginMode: isLoginMode ?? this.isLoginMode,
    );
  }
}

class AuthSignIn extends AuthState {
  const AuthSignIn({super.isLoginMode});

  @override
  AuthSignIn copyWith({bool? isLoginMode}) {
    return AuthSignIn(
      isLoginMode: isLoginMode ?? this.isLoginMode,
    );
  }
}

class AuthSignUp extends AuthState {
  const AuthSignUp({super.isLoginMode});

  @override
  AuthSignUp copyWith({bool? isLoginMode}) {
    return AuthSignUp(
      isLoginMode: isLoginMode ?? this.isLoginMode,
    );
  }
}

class AuthLoading extends AuthState {
  const AuthLoading({super.isLoginMode});

  @override
  AuthLoading copyWith({bool? isLoginMode}) {
    return AuthLoading(
      isLoginMode: isLoginMode ?? this.isLoginMode,
    );
  }
}

class Authenticated extends AuthState {
  final UserModel user;

  const Authenticated({required this.user, super.isLoginMode});

  @override
  Authenticated copyWith({UserModel? user, bool? isLoginMode}) {
    return Authenticated(
      user: user ?? this.user,
      isLoginMode: isLoginMode ?? this.isLoginMode,
    );
  }

  @override
  List<Object> get props => [user, isLoginMode];
}

class Unauthenticated extends AuthState {
  const Unauthenticated({super.isLoginMode});

  @override
  Unauthenticated copyWith({bool? isLoginMode}) {
    return Unauthenticated(
      isLoginMode: isLoginMode ?? this.isLoginMode,
    );
  }
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message, super.isLoginMode});

  @override
  AuthError copyWith({String? message, bool? isLoginMode}) {
    return AuthError(
      message: message ?? this.message,
      isLoginMode: isLoginMode ?? this.isLoginMode,
    );
  }

  @override
  List<Object> get props => [message, isLoginMode];
}
