import 'package:cakuticketapp/Model/unit_model.dart';
import 'package:cakuticketapp/Services/Database/database.dart';
import 'package:cakuticketapp/Services/Database/firestore_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'unit_state.dart';

class UnitCubit extends Cubit<UnitState> {
  UnitCubit() : super(const UnitInitial()) {
    init();
  }

  final Database _db = FireStoreDb();
  List<UnitModel?>? unitList;
  List<String?>? unitPartList = [];
  void init() async {
    emit(const UnitBusyState());
    getUnits();
  }


  void getUnits() async {
    try {
      unitList = await _db.getUnit();
      debugPrint(unitList![0]?.unitPartLsit![0].toString());
      unitList?.forEach(
        (element) {
          element?.unitPartLsit?.forEach((element) {
            unitPartList?.add(element);
          });
        },
      );
      emit(const UnitGetState());
    } catch (e) {
      emit(UnitErrorState(e.toString()));
    }
  }
}
