import 'package:cakuticketpersonal/Model/user_model.dart';
import 'package:cakuticketpersonal/Services/Auth/auth_service.dart';
import 'package:cakuticketpersonal/Services/Auth/firebase_auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashInitial()) {
    _init();
  }
  final AuthService _auth = FirebaseAuthService();
  void _init() async {
    emit(const SplashAuthState());
  }

  void goHome(UserModel model) {
    emit(SplashHomeState(model));
  }

  void signOut() async {
    await _auth.signOut();
    emit(const SplashAuthState());
  }
}
