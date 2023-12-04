import 'package:cakuticketpersonal/Model/Request/response_request_model.dart';
import 'package:cakuticketpersonal/Model/user_model.dart';
import 'package:cakuticketpersonal/Services/Database/database_service.dart';
import 'package:cakuticketpersonal/Services/Database/firebase_database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.formkey, this.model, this.requestController)
      : super(const HomeInitial()) {
    _init();
  }
  final GlobalKey<FormState> formkey;
  final UserModel model;
  final DatabaseService _db = FirebaseDatabaseService();
  ResponseRequestModel? selectedRequest;

  final TextEditingController? requestController;
  void _init() {
    emit(const HomeFormState());
  }

  void goHome([ResponseRequestModel? data]) async {
    emit(const HomeBusyState());
    await Future.delayed(const Duration(milliseconds: 500));
    selectedRequest = data;
    emit(const HomeFormState());
  }

  void updateRequest() async {
    try {
      emit(const HomeBusyState());
      selectedRequest?.solution = requestController?.text;
      await _db.updateRequest(selectedRequest!);
      requestController!.clear();
      selectedRequest = null;
      emit(const HomeDoneState());
      await Future.delayed(const Duration(seconds: 3));
      emit(const HomeFormState());
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}
