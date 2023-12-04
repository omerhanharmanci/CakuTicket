import 'package:caku_ticket_admin_panel/ViewModel/personal_cubit/personal_cubit.dart';
import 'package:caku_ticket_admin_panel/Widgets/app_circular_progress_indicator.dart';
import 'package:caku_ticket_admin_panel/Widgets/app_error_view.dart';
import 'package:caku_ticket_admin_panel/view/Personal/personal_add_view.dart';
import 'package:caku_ticket_admin_panel/view/Personal/personal_selected_show.dart';
import 'package:caku_ticket_admin_panel/view/Personal/personal_show_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalBuilder extends StatelessWidget {
  const PersonalBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalCubit, PersonalState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("PERSONEL"),
        ),
        body: _builder(context, state),
        floatingActionButton: FloatingActionButton(
          
          onPressed: () {
            context.read<PersonalCubit>().goAddPersonalView();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  _builder(BuildContext context, PersonalState state) {
    if (state is PersonalInitial) {
      return const AppCircularProgressIndicator();
    } else if (state is PersonalBusyState) {
      return const AppCircularProgressIndicator();
    } else if (state is PersonalErrorState) {
      return AppErrorView(content: state.error);
    } else if (state is PersonalShowState) {
      return const PersonalShowView();
    } else if (state is PersonalAddState) {
      return const PersonalAddView();
    } else if (state is PersonalSelectedShowState) {
      return const PersonalSelectedShow();
    }
  }
}
