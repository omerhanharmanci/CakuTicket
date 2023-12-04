part of 'personal_cubit.dart';

abstract class PersonalState {
  const PersonalState();
}

class PersonalInitial extends PersonalState {
  const PersonalInitial();
}

class PersonalBusyState extends PersonalState {
  const PersonalBusyState();
}

class PersonalErrorState extends PersonalState {
  const PersonalErrorState(this.error);
  final String? error;
}

class PersonalAddState extends PersonalState {
  const PersonalAddState();
}

class PersonalShowState extends PersonalState {
  const PersonalShowState();
}

class PersonalSelectedShowState extends PersonalState {
  const PersonalSelectedShowState();
}
