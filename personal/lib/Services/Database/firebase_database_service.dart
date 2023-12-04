import 'package:cakuticketpersonal/Model/Request/response_request_model.dart';
import 'package:cakuticketpersonal/Model/user_model.dart';
import 'package:cakuticketpersonal/Services/Database/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseDatabaseService extends DatabaseService {
  final FirebaseFirestore _requests = FirebaseFirestore.instance;

  @override
  Future<List<ResponseRequestModel?>?> getRequest(UserModel model) async {
    try {
      debugPrint("model uid:${model.uid}");
      var response = await _requests
          .collection("REQUESTS")
          .where("personal", isEqualTo: model.email)
          .get();

      return response.docs.map(
        (e) {
          debugPrint("******************************");
          debugPrint("VERİLERR${e.data()}");
          return ResponseRequestModel.fromMap(
            e.data(),
          );
        },
      ).toList();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> updateRequest(ResponseRequestModel model) async {
    try {
      var a = await _requests
          .collection("REQUESTS")
          .where("title", isEqualTo: model.title)
          .get();
      debugPrint("AAA:${a.docs[0].id}");
      await _requests
          .collection("REQUESTS")
          .doc(a.docs[0].id)
          .update(model.toMap());
    } catch (_) {
      rethrow;
    }
  }
}
