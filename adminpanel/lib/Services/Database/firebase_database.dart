import 'package:caku_ticket_admin_panel/Model/Personal/personal_model.dart';
import 'package:caku_ticket_admin_panel/Model/Personal/response_personal_model.dart';
import 'package:caku_ticket_admin_panel/Model/Personal/unit_model.dart';
import 'package:caku_ticket_admin_panel/Model/Request/response_request_model.dart';
import 'package:caku_ticket_admin_panel/Model/User/request_user_model.dart';
import 'package:caku_ticket_admin_panel/Model/User/response_user_model.dart';
import 'package:caku_ticket_admin_panel/Services/Database/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseDatabase extends Database {
  final _users = FirebaseFirestore.instance.collection("USERS");
  final _requests = FirebaseFirestore.instance.collection("REQUESTS");
  final _personals = FirebaseFirestore.instance.collection("PERSONALS");
  final _units = FirebaseFirestore.instance.collection("units");
  @override
  Future addUser(ResponseUserModel model) async {
    try {
      await _users.add(model.toMap());
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future deleteUser(RequestUserModel model) async {
    try {
      var response = await _users.where("uid", isEqualTo: model.uid).get();
      debugPrint(response.docs.toString());
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<ResponseUserModel?>?>? getAllUser() async {
    try {
      var response = await _users.get();
      var list = response.docs.map((e) {
        return ResponseUserModel(
          e.data()["uid"],
          e.data()["email"],
        );
      }).toList();
      return list;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<ResponseUserModel?>? getUserWithUid(RequestUserModel model) async {
    try {
      var response = await _users.where("uid", isEqualTo: model.uid).get();
      return ResponseUserModel.fromMap(response.docs[0].data());
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<ResponseRequestModel?>?>? getAllRequest() async {
    try {
      var response = await _requests.get();
      List<ResponseRequestModel?>? list = response.docs
          .map(
            (e) => ResponseRequestModel.fromMap(
              e.data(),
            ),
          )
          .toList();
      debugPrint(list.toString());
      return list;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future addPersonal(PersonalModel model) async {
    try {
      await _personals.add(model.toMap());
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<ResponsePersonalModel?>?>? getAllPersonal() async {
    try {
      var response = await _personals.get();
      return response.docs
          .map(
            (e) => ResponsePersonalModel.fromMap(
              e.data(),
            ),
          )
          .toList();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<UnitModel?>?>? getUnit() async {
    try {
      var response = await _units.get();
      var data = response.docs[0].data();

      var list = data.keys.toList().map((e) {
        debugPrint("e: $e");
        List value = data[e].toList();
        var valuelist = value.map((valueStr) => valueStr.toString()).toList();
        debugPrint("value: $value");
        return UnitModel(e, valuelist);
      }).toList();

      return list;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future addUnit(UnitModel model) async {
    try {
      await _units.doc("tdVlg0OoOgtUwSxXsa2N").update(
        {model.unitId.toString(): model.unitPartLsit},
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future upDateRequest(Map<String, dynamic>? map) async {
    try {
      var a = await _requests.where("title", isEqualTo: map?["title"]).get();
      await _requests.doc(a.docs[0].id).update(map!);
    } catch (_) {
      rethrow;
    }
  }
}
