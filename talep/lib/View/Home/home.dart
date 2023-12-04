import 'package:cakuticketapp/Model/response_sign_in_user_model.dart';
import 'package:cakuticketapp/View/Home/home_builder.dart';
import 'package:cakuticketapp/Viewmodel/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    this.model,
  });
  final ResponseSignInUserModel? model;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _requestController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _HomeState();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(
          _titleController, _requestController, _formKey,
          userModel: widget.model),
      child: const HomeBuilder(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _requestController.dispose();
    _formKey.currentState?.dispose();
  }
}
