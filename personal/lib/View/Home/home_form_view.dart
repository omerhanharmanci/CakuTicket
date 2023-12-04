import 'package:cakuticketpersonal/View/Home/Request/request_screen.dart';
import 'package:cakuticketpersonal/View/Home/request_show.dart';
import 'package:cakuticketpersonal/Viewmodel/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFormView extends StatelessWidget {
  const HomeFormView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return Form(
      key: cubit.formkey,
      child: Row(
        children: [
          RequestScreen(model: cubit.model),
          const RequestShow(),
        ],
      ),
    );
  }
}
