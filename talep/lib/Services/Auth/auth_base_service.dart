import 'package:cakuticketapp/Model/response_sign_in_user_model.dart';
import 'package:cakuticketapp/Model/sign_in_user_model.dart';

abstract class AuthBaseService {
  Future<ResponseSignInUserModel?> signIn(SignInUserModel user);
  Future<void> signOut();
  Future<ResponseSignInUserModel?> signUp(SignInUserModel user);
  
}
