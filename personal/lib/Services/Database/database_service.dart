import 'package:cakuticketpersonal/Model/Request/response_request_model.dart';
import 'package:cakuticketpersonal/Model/user_model.dart';

abstract class DatabaseService {
  Future<List<ResponseRequestModel?>?>? getRequest(UserModel model);
  Future<void> updateRequest(ResponseRequestModel model);
}
