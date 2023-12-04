part of 'user_cubit.dart';

abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserErrorState extends UserState {
  final String? error;

  UserErrorState(this.error);
}

class UserBusyState extends UserState {
  const UserBusyState();
}

class UserAddState extends UserState {
  const UserAddState();
}

class UserShowState extends UserState {
  const UserShowState();
}

class UserSelectedUserState extends UserState {
  const UserSelectedUserState();
}
