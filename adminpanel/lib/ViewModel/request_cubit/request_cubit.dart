import 'package:caku_ticket_admin_panel/Model/Personal/response_personal_model.dart';
import 'package:caku_ticket_admin_panel/Model/Request/response_request_model.dart';
import 'package:caku_ticket_admin_panel/Services/Database/database.dart';
import 'package:caku_ticket_admin_panel/Services/Database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit() : super(const RequestInitial()) {
    _init();
  }
  final Database _db = FirebaseDatabase();
  List<ResponseRequestModel?>? requestList;
  late final ResponseRequestModel? model;
  List<ResponsePersonalModel?>? allPersonal;

  void _init() {
    emit(const RequestBusyState());
    getAllPersonal();
    getAllRequest();
  }

  void getAllRequest() async {
    try {
      requestList = await _db.getAllRequest();
      emit(const RequestShowAllRequest());
    } catch (e) {
      emit(RequestErrorState(e.toString()));
    }
  }

  void requestOnTap(ResponseRequestModel? data) {
    emit(const RequestBusyState());
    model = data;
    emit(const RequestShowState());
  }

  void onChanged(String? value) async {
    try {
      model?.personalId = value;
      await _db.upDateRequest(model?.toMap());
    } catch (e) {
      emit(RequestErrorState(e.toString()));
    }
  }

  void getAllPersonal() async {
    try {
      allPersonal = await _db.getAllPersonal();
    } catch (e) {
      emit(RequestErrorState(e.toString()));
    }
  }
}
