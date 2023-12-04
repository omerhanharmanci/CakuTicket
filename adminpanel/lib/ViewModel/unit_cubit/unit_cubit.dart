import 'package:caku_ticket_admin_panel/Model/Personal/unit_model.dart';
import 'package:caku_ticket_admin_panel/Services/Database/database.dart';
import 'package:caku_ticket_admin_panel/Services/Database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'unit_state.dart';

class UnitCubit extends Cubit<UnitState> {
  final Database _db = FirebaseDatabase();
  List<UnitModel?>? unitList;
  List<String?>? unitPartList = [];
  String? unitId, unitPartId;

  UnitCubit() : super(const UnitInitial()) {
    init();
  }

  void init() {
    emit(const UnitBusyState());
    getUnit();
  }

  void getUnit() async {
    try {
      unitList = await _db.getUnit();
      unitList!
          .map(
            (e) => e?.unitPartLsit?.map((str) {
              unitPartList!.add(str);
            }).toList(),
          )
          .toList();
      emit(const UnitDoneDataState());
    } catch (e) {
      emit(UnitErrorState(e.toString()));
    }
  }

  unitPartOnChanged(Object? value) {
    value = unitPartId;
  }

  onChanged(value) {
    value = unitId;
  }
}
