import 'package:caku_ticket_admin_panel/ViewModel/request_cubit/request_cubit.dart';
import 'package:caku_ticket_admin_panel/view/Request/request_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestCubit(),
      child: const RequestBuilder(),
    );
  }
}
