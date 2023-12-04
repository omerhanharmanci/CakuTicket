import 'package:cakuticketpersonal/Model/login_user_model.dart';
import 'package:cakuticketpersonal/Model/user_model.dart';

abstract class AuthService {
  Future<UserModel?>? signIn(LoginUserModel model);
  Future<void> signOut();
  Future<UserModel?>? currentUser();
}
