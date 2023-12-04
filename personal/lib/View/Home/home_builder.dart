import 'package:cakuticketpersonal/View/Home/Request/request_success.dart';
import 'package:cakuticketpersonal/View/Home/home_form_view.dart';
import 'package:cakuticketpersonal/Viewmodel/home_cubit/home_cubit.dart';
import 'package:cakuticketpersonal/Viewmodel/splash_cubit/splash_cubit.dart';
import 'package:cakuticketpersonal/Widgets/app_circular_progress_indicator.dart';
import 'package:cakuticketpersonal/Widgets/app_error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBuiler extends StatelessWidget {
  const HomeBuiler({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = context.read<SplashCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "ANASAYFA",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            toolbarHeight: 100,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: IconButton(
                  iconSize: 50,
                  style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(50, 50)),
                  ),
                  onPressed: () => cubit.signOut(),
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                ),
              ),
            ],
          ),
          body: _builder(context, state),
        );
      },
    );
  }

  _builder(BuildContext context, HomeState state) {
    if (state is HomeErrorState) {
      return AppErrorView(message: state.error.toString());
    } else if (state is HomeFormState) {
      return const HomeFormView();
    } else if (state is HomeSignOutState) {
      context.read<SplashCubit>().signOut();
      return const AppCircularProgressIndicator();
    } else if (state is HomeDoneState) {
      return const RequestSuccess();
    } else {
      return const AppCircularProgressIndicator();
    }
  }
}
