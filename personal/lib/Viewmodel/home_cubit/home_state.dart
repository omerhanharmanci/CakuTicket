part of 'home_cubit.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeBusyState extends HomeState {
  const HomeBusyState();
}

class HomeErrorState extends HomeState {
  final String? error;

  HomeErrorState(this.error);
}

class HomeSignOutState extends HomeState {
  const HomeSignOutState();
}

class HomeFormState extends HomeState {
  const HomeFormState();
}

class HomeDoneState extends HomeState {
  const HomeDoneState();
}
