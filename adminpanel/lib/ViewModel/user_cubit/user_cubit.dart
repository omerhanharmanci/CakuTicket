import 'package:caku_ticket_admin_panel/Model/User/request_user_model.dart';
import 'package:caku_ticket_admin_panel/Model/User/response_user_model.dart';
import 'package:caku_ticket_admin_panel/Model/User/user_model.dart';
import 'package:caku_ticket_admin_panel/Services/Auth/auth.dart';
import 'package:caku_ticket_admin_panel/Services/Database/database.dart';
import 'package:caku_ticket_admin_panel/Services/Auth/firebase_auth.dart';
import 'package:caku_ticket_admin_panel/Services/Database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.emailController, this.passwordController, this.formKey)
      : super(const UserInitial()) {
    init();
  }
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final GlobalKey<FormState>? formKey;
  final Auth _auth = FirebaseAuthService();
  final Database _db = FirebaseDatabase();
  List<ResponseUserModel?>? userList;
  ResponseUserModel? selectedUser;
  void init() {
    _getAllUser();
  }

  void createUser(UserModel model) async {
    try {
      emit(const UserBusyState());
      var responseUser = await _auth.createUser(model);
      if (responseUser != null) {
        await _db.addUser(responseUser);
        emit(UserErrorState(responseUser.uid));
      } else {
        throw Exception("KULLANICI BOŞŞ GELDİ");
      }
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  void userAddOnPressed() {
    if (formKey!.currentState!.validate()) {
      var email = emailController!.text;
      var password = passwordController!.text;
      createUser(UserModel(email, password));
    }
  }

  void _getAllUser() async {
    try {
      userList = await _db.getAllUser();
      emit(const UserShowState());
    } catch (_) {
      rethrow;
    }
  }

  void listTileOnTap(int index) async {
    try {
      var data = userList![index];
      selectedUser =
          await _db.getUserWithUid(RequestUserModel(data!.uid, data.email));
      emit(const UserSelectedUserState());
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  goAddUser() {
    emit(const UserAddState());
  }
}
