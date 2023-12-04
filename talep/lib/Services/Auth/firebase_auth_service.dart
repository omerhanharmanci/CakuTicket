import 'package:cakuticketapp/Model/response_sign_in_user_model.dart';
import 'package:cakuticketapp/Model/sign_in_user_model.dart';
import 'package:cakuticketapp/Services/Auth/auth_base_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService extends AuthBaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<ResponseSignInUserModel?> signIn(SignInUserModel user) async {
    try {
      var response = await _auth.signInWithEmailAndPassword(
          email: user.mail, password: user.password);
      return _createResponseUserModel(response.user);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<ResponseSignInUserModel?> signUp(SignInUserModel user) async {
    try {
      var response = await _auth.createUserWithEmailAndPassword(
          email: user.mail, password: user.password);
      return _createResponseUserModel(response.user);
    } catch (_) {
      rethrow;
    }
  }

  ResponseSignInUserModel? _createResponseUserModel(User? user) {
    return user?.uid == null
        ? null
        : ResponseSignInUserModel(user?.uid, user?.email);
  }
}
