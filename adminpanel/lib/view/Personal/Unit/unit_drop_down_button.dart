import 'package:caku_ticket_admin_panel/ViewModel/unit_cubit/unit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitDropDownButton extends StatelessWidget {
  const UnitDropDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<UnitCubit>();
    var list = cubit.unitList!
        .map((e) => DropdownMenuItem(
            value: e?.unitId, child: Text(e?.unitId.toString() ?? "asdf")))
        .toList();
    var plist = cubit.unitPartList!
        .map((e) =>
            DropdownMenuItem(value: e, child: Text(e?.toString() ?? "asdf")))
        .toList();
    return Column(
      children: [
        DropdownButtonFormField(
          items: list,
          onChanged: (value) => cubit.onChanged(value),
        ),
        DropdownButtonFormField(
            items: plist, onChanged: (value) => cubit.unitPartOnChanged(value))
      ],
    );
  }
}
