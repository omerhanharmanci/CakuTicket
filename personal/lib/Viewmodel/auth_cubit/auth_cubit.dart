import 'package:cakuticketpersonal/Model/login_user_model.dart';
import 'package:cakuticketpersonal/Model/user_model.dart';
import 'package:cakuticketpersonal/Services/Auth/auth_service.dart';
import 'package:cakuticketpersonal/Services/Auth/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.mailConroller, this.passwordController, this.formkey)
      : super(const AuthInitial()) {
    _init();
  }

  final TextEditingController mailConroller, passwordController;
  final GlobalKey<FormState> formkey;
  final AuthService _auth = FirebaseAuthService();

  void _init() async {
    curretUser();
  }

  void curretUser() async {
    try {
      var user = await _auth.currentUser();
      if (user != null) {
        emit(AuthDoneState(user));
      } else {
        emit(const AuthFormState());
      }
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }

  void signIn(LoginUserModel model) async {
    try {
      var user = await _auth.signIn(model);
      if (user != null) {
        emit(AuthDoneState(user));
      } else {
        emit(AuthErrorState("KULLANICI BOŞ GELDİ"));
      }
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }

  loginOnPressed() {
    if (formkey.currentState!.validate()) {
      emit(const AuthBusyState());
      var email = mailConroller.text;
      var password = passwordController.text;
      signIn(LoginUserModel(email, password));
    }
  }
}
