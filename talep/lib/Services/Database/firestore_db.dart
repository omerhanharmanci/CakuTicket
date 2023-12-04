import 'package:cakuticketapp/Model/request_model.dart';
import 'package:cakuticketapp/Model/unit_model.dart';
import 'package:cakuticketapp/Services/Database/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStoreDb extends Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future sendRequest(RequestModel? model) async {
    try {
      var response =
          await _firestore.collection("REQUESTS").add(model!.toMap());

      return response;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<UnitModel?>?>? getUnit() async {
    try {
      var response = await _firestore.collection("units").get();
      return response.docs[0].data().keys.toList().map((e) {
        List? list = response.docs[0].data()[e].toList();
        debugPrint(list.toString());
        return UnitModel(e, list?.map((e) => e.toString()).toList());
      }).toList();
    } catch (_) {
      rethrow;
    }
  }
}
