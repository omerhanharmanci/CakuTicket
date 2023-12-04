import 'package:caku_ticket_admin_panel/Model/User/response_user_model.dart';
import 'package:caku_ticket_admin_panel/Model/User/user_model.dart';

abstract class Auth {
  Future<ResponseUserModel?>? createUser(UserModel model);
}
