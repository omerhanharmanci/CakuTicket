import 'package:caku_ticket_admin_panel/ViewModel/unit_cubit/unit_cubit.dart';
import 'package:caku_ticket_admin_panel/Widgets/app_circular_progress_indicator.dart';
import 'package:caku_ticket_admin_panel/Widgets/app_error_view.dart';
import 'package:caku_ticket_admin_panel/view/Personal/Unit/unit_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitBuilder extends StatelessWidget {
  const UnitBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnitCubit, UnitState>(
      builder: (context, state) => _builder(context, state),
    );
  }

  _builder(BuildContext context, UnitState state) {
    if (state is UnitInitial) {
      return const AppCircularProgressIndicator();
    } else if (state is UnitErrorState) {
      return AppErrorView(content: state.error.toString());
    } else if (state is UnitBusyState) {
      return const AppCircularProgressIndicator();
    } else if (state is UnitDoneDataState) {
      return const UnitDropDownButton();
    }
  }
}
