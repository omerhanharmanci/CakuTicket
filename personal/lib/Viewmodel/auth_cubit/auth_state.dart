part of 'auth_cubit.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthBusyState extends AuthState {
  const AuthBusyState();
}

class AuthErrorState extends AuthState {
  final String? error;

  AuthErrorState(this.error);
}

class AuthDoneState extends AuthState {
  final UserModel model;

  AuthDoneState(this.model);
}

class AuthFormState extends AuthState {
  const AuthFormState();
}
