import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  const BaseState();
  @override
  List<Object?> get props => [];
}

class Loading extends BaseState {}

class Initial extends BaseState {}

class Error extends BaseState {
  final String message;

  const Error({required this.message});

  @override
  List<Object?> get props => [message];
}
