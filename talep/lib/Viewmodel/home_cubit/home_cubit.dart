import 'package:cakuticketapp/Model/request_model.dart';
import 'package:cakuticketapp/Model/response_sign_in_user_model.dart';
import 'package:cakuticketapp/Services/Database/database.dart';
import 'package:cakuticketapp/Services/Database/firestore_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.titleController, this.requestController, this.formKey,
      {this.userModel})
      : super(const HomeInitial()) {
    _init();
  }

  final TextEditingController titleController;
  final TextEditingController requestController;
  final GlobalKey<FormState> formKey;
  final Database _db = FireStoreDb();
  late final RequestModel model;
  String? unitValue;
  String? unitPartValue;
  final ResponseSignInUserModel? userModel;
  void _init() async {
    emit(const HomeFormState());
  }

  onPressed() async {
    if (formKey.currentState!.validate()) {
      var title = titleController.text;
      var request = requestController.text;
      model = RequestModel(
        title,
        request,
        unitValue,
        unitPartValue,
        DateTime.now(),
        "TALEP ALINDI",
        userModel!.uid,
      );
      sendRequest(model);
    }
  }

  void sendRequest(RequestModel model) async {
    try {
      emit(const HomeBusyState());
      await _db.sendRequest(model);
      emit(const HomeDoneState());
      await Future.delayed(const Duration(seconds: 3));
      requestController.clear();
      titleController.clear();
      emit(const HomeFormState());
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}
