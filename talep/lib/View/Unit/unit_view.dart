import 'package:cakuticketapp/View/Widgets/app_drop_down_button.dart';
import 'package:cakuticketapp/Viewmodel/home_cubit/home_cubit.dart';
import 'package:cakuticketapp/Viewmodel/unit_cubit/unit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitView extends StatelessWidget {
  const UnitView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<UnitCubit>();

    return Column(
      children: [
        AppDropDownButton(
          onChanged: (value) => context.read<HomeCubit>().unitValue = value,
          items: cubit.unitList!
              .map(
                (e) => DropdownMenuItem(
                  value: e?.unitId,
                  child: Text(e?.unitId ?? "asdf"),
                ),
              )
              .toList(),
        ),
        AppDropDownButton(
          onChanged: (value) => context.read<HomeCubit>().unitPartValue = value,
          items: cubit.unitPartList!
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e ?? "asdf"),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
