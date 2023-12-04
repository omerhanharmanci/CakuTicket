class RequestModel {
  final String? userId;
  final String? title;
  final String? request;
  final String? unitId;
  final String? unitPartId;
  final DateTime? createdTime;
  final String? situation;

  RequestModel(
    this.title,
    this.request,
    this.unitId,
    this.unitPartId,
    this.createdTime,
    this.situation,
    this.userId,
  );

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "title": title,
      "request": request,
      "unitId": unitId,
      "unitPartId": unitPartId,
      "createdTime": createdTime,
      "situation": situation
    };
  }
}
