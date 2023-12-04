import 'package:cakuticketapp/Model/response_sign_in_user_model.dart';
import 'package:cakuticketapp/Services/Auth/auth_base_service.dart';
import 'package:cakuticketapp/Services/Auth/firebase_auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashAuthState()) {
    _init();
  }

  final AuthBaseService _auth = FirebaseAuthService();

  void _init() {
    emit(const SplashAuthState());
  }

  void goHome(ResponseSignInUserModel model) {
    emit(SplashHomeState(model));
  }

  goAuth() async {
    await _auth.signOut();
    emit(const SplashAuthState());
  }
}
