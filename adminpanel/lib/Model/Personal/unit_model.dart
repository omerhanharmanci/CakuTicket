class UnitModel {
  final String? unitId;
  final List<String?>? unitPartLsit;

  UnitModel(this.unitId, this.unitPartLsit);

  Map<String, dynamic> toMap() => {
        "unitId": unitId,
        "unitPartList": unitPartLsit?.map((e) => e),
      };
}
