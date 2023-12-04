import 'package:cakuticketpersonal/Model/login_user_model.dart';
import 'package:cakuticketpersonal/Model/user_model.dart';
import 'package:cakuticketpersonal/Services/Auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService extends AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserModel?>? signIn(LoginUserModel model) async {
    try {
      debugPrint("email: ${model.email} password: ${model.password}");
      var credential = await _auth.signInWithEmailAndPassword(
        email: model.email.toString(),
        password: model.password.toString(),
      );

      return _converUserModel(credential.user);
    } on FirebaseAuthException catch (_) {
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

  UserModel? _converUserModel(User? user) {
    if (user != null) {
      return UserModel(user.uid, user.email, user.displayName);
    } else {
      return null;
    }
  }

  @override
  Future<UserModel?>? currentUser() async {
    try {
      return _converUserModel(_auth.currentUser);
    } catch (_) {
      rethrow;
    }
  }
}
