part of 'unit_cubit.dart';

abstract class UnitState {
  const UnitState();
}

class UnitInitial extends UnitState {
  const UnitInitial();
}

class UnitBusyState extends UnitState {
  const UnitBusyState();
}

class UnitErrorState extends UnitState {
  const UnitErrorState(this.error);

  final String? error;
}

class UnitDoneDataState extends UnitState {
  const UnitDoneDataState();
}

class UnitPartListDataState extends UnitState {
  const UnitPartListDataState();
}
