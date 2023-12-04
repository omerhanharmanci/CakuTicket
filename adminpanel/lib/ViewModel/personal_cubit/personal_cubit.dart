import 'package:caku_ticket_admin_panel/Model/Personal/personal_model.dart';
import 'package:caku_ticket_admin_panel/Model/Personal/response_personal_model.dart';
import 'package:caku_ticket_admin_panel/Model/User/user_model.dart';
import 'package:caku_ticket_admin_panel/Services/Auth/auth.dart';
import 'package:caku_ticket_admin_panel/Services/Auth/firebase_auth.dart';
import 'package:caku_ticket_admin_panel/Services/Database/database.dart';
import 'package:caku_ticket_admin_panel/Services/Database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'personal_state.dart';

class PersonalCubit extends Cubit<PersonalState> {
  List<ResponsePersonalModel?>? personalList;

  PersonalCubit(
    this.personalNameController,
    this.personalMailController,
    this.passwordController,
    this.formKey,
  ) : super(const PersonalInitial()) {
    init();
  }

  final Database _db = FirebaseDatabase();
  final Auth _auth = FirebaseAuthService();
  final TextEditingController? personalNameController,
      personalMailController,
      passwordController;
  final GlobalKey<FormState> formKey;
  ResponsePersonalModel? model;
  void init() {
    emit(const PersonalBusyState());
    getAllPersonal();
  }

  void addPersonal(PersonalModel model) async {
    try {
      await _db.addPersonal(model);
      await _auth.createUser(
        UserModel(model.perosnalMail, passwordController!.text),
      );
      emit(const PersonalShowState());
    } catch (e) {
      emit(PersonalErrorState(e.toString()));
    }
  }

  void addPersonalOnPressed() {
    if (formKey.currentState!.validate()) {
      emit(const PersonalBusyState());
      var name = personalNameController?.text;
      var mail = personalMailController?.text;
      addPersonal(
          PersonalModel(name, mail, "BILGI_ISLEM", "yazilim", "tekniker"));
    }
  }

  void goAddPersonalView() {
    emit(const PersonalAddState());
  }

  void getAllPersonal() async {
    try {
      personalList = await _db.getAllPersonal();
      emit(const PersonalShowState());
    } catch (e) {
      emit(PersonalErrorState(e.toString()));
    }
  }

  personalOnTap(ResponsePersonalModel? data) {
    model = data;
    emit(const PersonalSelectedShowState());
  }
}
