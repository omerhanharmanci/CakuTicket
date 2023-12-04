import 'package:caku_ticket_admin_panel/Model/Personal/personal_model.dart';
import 'package:caku_ticket_admin_panel/Model/Personal/response_personal_model.dart';
import 'package:caku_ticket_admin_panel/Model/Personal/unit_model.dart';
import 'package:caku_ticket_admin_panel/Model/Request/response_request_model.dart';
import 'package:caku_ticket_admin_panel/Model/User/request_user_model.dart';
import 'package:caku_ticket_admin_panel/Model/User/response_user_model.dart';

abstract class Database {
  Future addUser(ResponseUserModel model);
  Future deleteUser(RequestUserModel model);
  Future<List<ResponseUserModel?>?>? getAllUser();
  Future<ResponseUserModel?>? getUserWithUid(RequestUserModel model);
  Future<List<ResponseRequestModel?>?>? getAllRequest();
  Future<List<ResponsePersonalModel?>?>? getAllPersonal();
  Future addPersonal(PersonalModel model);
  Future<List<UnitModel?>?>? getUnit();
  Future addUnit(UnitModel model);
  Future upDateRequest(Map<String, dynamic>? map);
}
