class ResponseRequestModel {
  final DateTime? createdTime;
  final String? request;
  final String? situation;
  final String? title;
  final String? unitId;
  final String? unitPartId;
  final String? userId;
  String? personalId;

  ResponseRequestModel(
    this.createdTime,
    this.request,
    this.situation,
    this.title,
    this.unitId,
    this.unitPartId,
    this.userId,
    this.personalId,
  );

  factory ResponseRequestModel.fromMap(Map<String, dynamic> map) =>
      ResponseRequestModel(
        DateTime.now(),
        map["request"],
        map["situation"],
        map["title"],
        map["unitId"],
        map["unitPartId"],
        map["userId"],
        map["personal"],
      );

  Map<String, dynamic> toMap() => {
        "createdTime": createdTime,
        "request": request,
        "situation": situation,
        "title": title,
        "unitId": unitId,
        "unitPartId": unitPartId,
        "userId": userId,
        "personal": personalId,
      };
}
