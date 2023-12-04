import 'package:cakuticketapp/View/Unit/unit_builder.dart';
import 'package:cakuticketapp/Viewmodel/unit_cubit/unit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitDropDownButton extends StatefulWidget {
  const UnitDropDownButton({super.key});

  @override
  State<UnitDropDownButton> createState() => _UnitDropDownButtonState();
}

class _UnitDropDownButtonState extends State<UnitDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UnitCubit(),
      child: const UnitBuiler(),
    );
  }
}
