import 'package:caku_ticket_admin_panel/ViewModel/request_cubit/request_cubit.dart';
import 'package:caku_ticket_admin_panel/Widgets/app_circular_progress_indicator.dart';
import 'package:caku_ticket_admin_panel/Widgets/app_error_view.dart';
import 'package:caku_ticket_admin_panel/view/Request/request_all_show.dart';
import 'package:caku_ticket_admin_panel/view/Request/request_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestBuilder extends StatelessWidget {
  const RequestBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestCubit, RequestState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("TALEPLER"),
        ),
        body: _builder(context, state),
      ),
    );
  }

  _builder(BuildContext context, RequestState state) {
    if (state is RequestInitial) {
      return const AppCircularProgressIndicator();
    } else if (state is RequestBusyState) {
      return const AppCircularProgressIndicator();
    } else if (state is RequestErrorState) {
      return AppErrorView(title: state.error.toString());
    } else if (state is RequestShowAllRequest) {
      return const RequestAllShow();
    } else if (state is RequestShowState) {
      return const RequestShow();
    }
  }
}
