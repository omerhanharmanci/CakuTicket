part of 'unit_add_cubit.dart';

abstract class UnitAddState {
  const UnitAddState();
}

class UnitAddInitial extends UnitAddState {
  const UnitAddInitial();
}

class UnitAddBusyState extends UnitAddState {
  const UnitAddBusyState();
}

class UnitAddErrorState extends UnitAddState {
  const UnitAddErrorState(this.error);

  final String? error;
}

class UnitAddFormState extends UnitAddState {
  const UnitAddFormState();
}
