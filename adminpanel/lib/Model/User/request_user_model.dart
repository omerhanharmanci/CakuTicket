class RequestUserModel {
  final String? uid;
  final String? email;

  RequestUserModel(this.uid, this.email);



  Map<String,dynamic> toMap(){
    return {
      "uid":uid,
      "email":email,
    };
  }


}
