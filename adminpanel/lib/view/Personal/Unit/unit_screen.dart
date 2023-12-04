import 'package:caku_ticket_admin_panel/ViewModel/unit_cubit/unit_cubit.dart';
import 'package:caku_ticket_admin_panel/view/Personal/Unit/unit_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitScreen extends StatelessWidget {
  const UnitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UnitCubit(),
      child: const UnitBuilder(),
    );
  }
}
