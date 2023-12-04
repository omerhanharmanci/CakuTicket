class PersonalModel {
  final String? personalName;
  final String? perosnalMail;
  final String? personalUnit;
  final String? personalUnitPart;
  final String? personalRank;

  PersonalModel(
    this.personalName,
    this.perosnalMail,
    this.personalUnit,
    this.personalUnitPart,
    this.personalRank,
  );

  Map<String, dynamic> toMap() => {
        "personalName": personalName,
        "personalMail": perosnalMail,
        "personalUnit": personalUnit,
        "personalUnitPart": personalUnitPart,
        "personalRank": personalRank,
      };
}
