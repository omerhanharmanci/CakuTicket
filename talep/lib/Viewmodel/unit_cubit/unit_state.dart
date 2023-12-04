part of 'unit_cubit.dart';

abstract class UnitState {
  const UnitState();
}

class UnitInitial extends UnitState {
  const UnitInitial();
}

class UnitErrorState extends UnitState {
  final String? error;
  UnitErrorState(this.error);
}

class UnitBusyState extends UnitState {
  const UnitBusyState();
}


class UnitGetState extends UnitState {
  const UnitGetState();
}
