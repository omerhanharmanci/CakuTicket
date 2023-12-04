import 'package:cakuticketapp/Model/request_model.dart';
import 'package:cakuticketapp/Model/unit_model.dart';

abstract class Database {
  Future<List<UnitModel?>?>? getUnit();
  Future sendRequest(RequestModel? model);
}
