import 'package:flutter/material.dart';

import '../core/network/failures.dart';

@immutable
abstract class RegisterState {
  const RegisterState();
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterStateLoading extends RegisterState {}

class RegisterStateLoaded extends RegisterState {
}

class RegisterStateError extends RegisterState {
  final Failure message;

  const RegisterStateError(this.message);

  @override
  List<Object?> get props => [message];
}