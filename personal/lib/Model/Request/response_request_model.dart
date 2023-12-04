import 'package:cloud_firestore/cloud_firestore.dart';

class ResponseRequestModel {
  final String? title, request, unitId, unitPartId, situation, personal;
  String? solution;
  final Timestamp? createdTime;

  ResponseRequestModel(
    this.title,
    this.request,
    this.unitId,
    this.unitPartId,
    this.situation,
    this.personal,
    this.createdTime,
    this.solution,
  );

  factory ResponseRequestModel.fromMap(Map<String?, dynamic> map) =>
      ResponseRequestModel(
        map["title"],
        map["request"],
        map["unitId"],
        map["unitPartId"],
        map["situation"],
        map["personal"],
        map["createdTime"],
        map["solution"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "request": request,
        "unitId": unitId,
        "unitPartId": unitPartId,
        "situation": situation,
        "personal": personal,
        "createdTime": createdTime,
        "solution": solution,
      };
}
