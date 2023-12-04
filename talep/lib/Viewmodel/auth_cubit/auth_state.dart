part of 'auth_cubit.dart';

sealed class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthBusyState extends AuthState {
  const AuthBusyState();
}

class AuthFormState extends AuthState {
  const AuthFormState();
}

class AuthErrorState extends AuthState {
  final String? error;

  AuthErrorState(this.error);
}

class AuthDoneState extends AuthState {
  const AuthDoneState(this.model);
  final ResponseSignInUserModel model;
}
