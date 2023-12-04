import 'package:cakuticketpersonal/Model/Request/response_request_model.dart';
import 'package:cakuticketpersonal/Model/user_model.dart';
import 'package:cakuticketpersonal/Services/Database/database_service.dart';
import 'package:cakuticketpersonal/Services/Database/firebase_database_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit(this.model) : super(const RequestInitial()) {
    _init();
  }

  final DatabaseService _db = FirebaseDatabaseService();
  List<ResponseRequestModel?>? requestList;
  final UserModel model;

  void _init() async {
    getRequest();
  }

  void getRequest() async {
    try {
      requestList = await _db.getRequest(model);
      emit(const RequestFormState());
    } catch (e) {
      emit(RequestErrorState(e.toString()));
    }
  }

  void goDone() => emit(const RequestDoneState());
}
