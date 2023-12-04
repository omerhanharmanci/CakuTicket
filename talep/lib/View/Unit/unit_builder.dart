import 'package:cakuticketapp/View/Unit/unit_view.dart';
import 'package:cakuticketapp/View/Widgets/app_circular_progress_indircator.dart';
import 'package:cakuticketapp/View/Widgets/app_error_view.dart';
import 'package:cakuticketapp/Viewmodel/unit_cubit/unit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitBuiler extends StatelessWidget {
  const UnitBuiler({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnitCubit, UnitState>(
      builder: (context, state) => _builder(context, state),
    );
  }

  _builder(BuildContext context, UnitState state) {
    if (state is UnitBusyState) {
      return const AppCircularProgressIndicator();
    } else if (state is UnitErrorState) {
      return AppErrorView(
        message: state.error,
      );
    } else if (state is UnitGetState) {
      return const UnitView();
    }
  }
}
