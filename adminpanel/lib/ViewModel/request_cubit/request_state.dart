part of 'request_cubit.dart';

abstract class RequestState {
  const RequestState();
}

class RequestInitial extends RequestState {
  const RequestInitial();
}

class RequestErrorState extends RequestState {
  final String? error;

  RequestErrorState(this.error);
}

class RequestBusyState extends RequestState {
  const RequestBusyState();
}

class RequestShowAllRequest extends RequestState {
  const RequestShowAllRequest();
}

class RequestShowState extends RequestState {
  const RequestShowState();
}
