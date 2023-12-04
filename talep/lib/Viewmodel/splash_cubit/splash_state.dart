part of 'splash_cubit.dart';

abstract class SplashState {
  const SplashState();
}

class SplashInitial extends SplashState {
  const SplashInitial();
}

class SplashBusyState extends SplashState {
  const SplashBusyState();
}

class SplashErrorState extends SplashState {
  final String? error;

  SplashErrorState(this.error);
}

class SplashAuthState extends SplashState {
  const SplashAuthState();
}

class SplashHomeState extends SplashState {
  const SplashHomeState(this.model);
  final ResponseSignInUserModel model;
}
