import 'package:cakuticketpersonal/View/Auth/auth_form_view.dart';
import 'package:cakuticketpersonal/Viewmodel/auth_cubit/auth_cubit.dart';
import 'package:cakuticketpersonal/Viewmodel/splash_cubit/splash_cubit.dart';
import 'package:cakuticketpersonal/Widgets/app_circular_progress_indicator.dart';
import 'package:cakuticketpersonal/Widgets/app_error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBuilder extends StatelessWidget {
  const AuthBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "GİRİŞ YAPINIZ",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            toolbarHeight: 100,
          ),
          body: _builder(context, state),
        );
      },
    );
  }

  _builder(BuildContext context, AuthState state) {
    if (state is AuthInitial) {
      return const AppCircularProgressIndicator();
    } else if (state is AuthFormState) {
      return const AuthFormView();
    } else if (state is AuthDoneState) {
      context.read<SplashCubit>().goHome(state.model);
      return const AppCircularProgressIndicator();
    } else if (state is AuthErrorState) {
      return AppErrorView(
        message: state.error,
      );
    } else {
      return const AppCircularProgressIndicator();
    }
  }
}
