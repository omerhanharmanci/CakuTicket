part of 'home_cubit.dart';

sealed class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeBusyState extends HomeState {
  const HomeBusyState();
}

class HomeErrorState extends HomeState {
  final String? message;

  const HomeErrorState(this.message);
}

class HomeDoneState extends HomeState {
  const HomeDoneState();
}

class HomeFormState extends HomeState {
  const HomeFormState();
}
