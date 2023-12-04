class ResponseUserModel {
  final String? uid;
  final String? email;

  ResponseUserModel(this.uid, this.email);

  factory ResponseUserModel.fromMap(Map<String?, dynamic> map) =>
      ResponseUserModel(map["uid"], map["email"]);

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
    };
  }
}
