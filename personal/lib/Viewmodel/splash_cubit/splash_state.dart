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
  const SplashErrorState(this.error);
  final String? error;
}

class SplashAuthState extends SplashState {
  const SplashAuthState();
}

class SplashHomeState extends SplashState {
  const SplashHomeState(this.model);
  final UserModel? model;
}
