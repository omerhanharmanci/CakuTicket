import 'package:cakuticketpersonal/Model/user_model.dart';
import 'package:cakuticketpersonal/View/Home/Request/request_builder.dart';
import 'package:cakuticketpersonal/Viewmodel/request_cubit/request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key, required this.model});
  final UserModel? model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestCubit(model!),
      child: const RequestBuilder(),
    );
  }
}
