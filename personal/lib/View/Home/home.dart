import 'package:cakuticketpersonal/Model/user_model.dart';
import 'package:cakuticketpersonal/View/Home/home_builder.dart';
import 'package:cakuticketpersonal/Viewmodel/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.model});
  final UserModel model;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _requestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        _formkey,
        widget.model,
        _requestController,
      ),
      child: const HomeBuiler(),
    );
  }
}
