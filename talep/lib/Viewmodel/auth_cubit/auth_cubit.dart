import 'package:cakuticketapp/Model/response_sign_in_user_model.dart';
import 'package:cakuticketapp/Model/sign_in_user_model.dart';
import 'package:cakuticketapp/Services/Auth/auth_base_service.dart';
import 'package:cakuticketapp/Services/Auth/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.userNameController,
    this.passwordController,
    this.formkey,
  ) : super(const AuthInitial()) {
    _init();
  }
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formkey;
  final AuthBaseService _authService = FirebaseAuthService();

  void _init() {
    emit(const AuthFormState());
  }

  Future<void> signIn(SignInUserModel user) async {
    try {
      var model = await _authService.signIn(user);
      if (model != null) {
        emit(AuthDoneState(model));
      } else {
        emit(
          AuthErrorState("kullanıcı gelmedi"),
        );
      }
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }

  void loginOnpressed() async {
    if (formkey.currentState!.validate()) {
      emit(const AuthBusyState());
      final mail = userNameController.text;
      final password = passwordController.text;
      final user = SignInUserModel(mail: mail, password: password);
      debugPrint("mail: $mail şifre:  $password");
      await signIn(user);
    }
  }
}
