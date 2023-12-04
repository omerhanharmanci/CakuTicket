import 'package:caku_ticket_admin_panel/Model/User/response_user_model.dart';
import 'package:caku_ticket_admin_panel/Model/User/user_model.dart';
import 'package:caku_ticket_admin_panel/Services/Auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService extends Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<ResponseUserModel?> createUser(UserModel model) async {
    try {
      if (model.email != null && model.password != null) {
        var credential = await _auth.createUserWithEmailAndPassword(
            email: model.email!, password: model.password!);
        await _auth.signOut();
        return _createResponseUserModel(credential.user);
      } else {
        return null;
      }
    } catch (_) {
      rethrow;
    }
  }

  ResponseUserModel? _createResponseUserModel(User? user) {
    if (user != null) {
      return ResponseUserModel(user.uid, user.email);
    } else {
      return null;
    }
  }

  
}
