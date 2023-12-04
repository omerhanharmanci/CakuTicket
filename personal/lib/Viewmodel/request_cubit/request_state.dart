part of 'request_cubit.dart';

abstract class RequestState {
  const RequestState();
}

class RequestInitial extends RequestState {
  const RequestInitial();
}

class RequestErrorState extends RequestState {
  const RequestErrorState(this.error);
  final String? error;
}

class RequestBusyState extends RequestState {
  const RequestBusyState();
}

class RequestFormState extends RequestState {
  const RequestFormState();
}

class RequestDoneState extends RequestState {
  const RequestDoneState();
}
