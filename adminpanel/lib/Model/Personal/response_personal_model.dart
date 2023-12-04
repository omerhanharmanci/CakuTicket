class ResponsePersonalModel {
  final String? personalName;
  final String? perosnalMail;
  final String? personalUnit;
  final String? personalUnitPart;
  final String? personalRank;

  ResponsePersonalModel(
    this.personalName,
    this.perosnalMail,
    this.personalUnit,
    this.personalUnitPart,
    this.personalRank,
  );

  factory ResponsePersonalModel.fromMap(Map<String?, dynamic> map) =>
      ResponsePersonalModel(
        map["personalName"],
        map["personalMail"],
        map["personalUnit"],
        map["personalUnitPart"],
        map["personalRank"],
      );
}
