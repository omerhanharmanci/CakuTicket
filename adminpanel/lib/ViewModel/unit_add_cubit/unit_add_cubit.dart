import 'package:caku_ticket_admin_panel/Model/Personal/unit_model.dart';
import 'package:caku_ticket_admin_panel/Services/Database/database.dart';
import 'package:caku_ticket_admin_panel/Services/Database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'unit_add_state.dart';

class UnitAddCubit extends Cubit<UnitAddState> {
  UnitAddCubit(
    this.unitController,
    this.unitPartController,
    this.formKey,
  ) : super(const UnitAddInitial()) {
    _init();
  }

  final Database _db = FirebaseDatabase();
  final TextEditingController unitController;
  final TextEditingController unitPartController;
  final GlobalKey<FormState> formKey;
  void _init() async {
    emit(const UnitAddFormState());
  }

  void addUnit(UnitModel model) async {
    try {
      await _db.addUnit(model);
      emit(const UnitAddFormState());
    } catch (e) {
      emit(UnitAddErrorState(e.toString()));
    }
  }

  unitAddOnPressed() {
    if (formKey.currentState!.validate()) {
      emit(const UnitAddBusyState());
      var unit = unitController.text;
      var unitParts = unitPartController.text;
      var unitPartList = unitParts.split(",");

      addUnit(UnitModel(unit, unitPartList));
    }
  }
}
