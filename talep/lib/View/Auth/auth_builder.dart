import 'package:cakuticketapp/View/Auth/auth_form_view.dart';
import 'package:cakuticketapp/View/Widgets/app_circular_progress_indircator.dart';
import 'package:cakuticketapp/View/Widgets/app_error_view.dart';
import 'package:cakuticketapp/Viewmodel/auth_cubit/auth_cubit.dart';
import 'package:cakuticketapp/Viewmodel/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBuilder extends StatelessWidget {
  const AuthBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(),
        body: _builder(context, state),
      ),
    );
  }

  _builder(BuildContext context, AuthState state) {
    if (state is AuthInitial) {
      return const AppCircularProgressIndicator();
    } else if (state is AuthBusyState) {
      return const AppCircularProgressIndicator();
    } else if (state is AuthFormState) {
      return const AuthFormView();
    } else if (state is AuthDoneState) {
      context.read<SplashCubit>().goHome(state.model);
    } else if (state is AuthErrorState) {
      return AppErrorView(
        message: state.error,
      );
    } else {
      return Container();
    }
  }
}
