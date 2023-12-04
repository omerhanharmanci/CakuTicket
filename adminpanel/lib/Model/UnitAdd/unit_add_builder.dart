import 'package:caku_ticket_admin_panel/Model/UnitAdd/unit_add_form_view.dart';
import 'package:caku_ticket_admin_panel/ViewModel/unit_add_cubit/unit_add_cubit.dart';
import 'package:caku_ticket_admin_panel/Widgets/app_circular_progress_indicator.dart';
import 'package:caku_ticket_admin_panel/Widgets/app_error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitAddBuilder extends StatelessWidget {
  const UnitAddBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnitAddCubit, UnitAddState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "BİRİM EKLEME",
            ),
          ),
          body: _buider(context, state),
        );
      },
    );
  }

  _buider(BuildContext context, UnitAddState state) {
    if (state is UnitAddInitial) {
      return const AppCircularProgressIndicator();
    } else if (state is UnitAddBusyState) {
      return const AppCircularProgressIndicator();
    } else if (state is UnitAddErrorState) {
      return AppErrorView(
        title: state.error,
      );
    } else if (state is UnitAddFormState) {
      return const UnitAddFormView();
    }
  }
}
