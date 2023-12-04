import 'package:cakuticketapp/View/Auth/auth_screen.dart';
import 'package:cakuticketapp/View/Home/home.dart';
import 'package:cakuticketapp/View/Widgets/app_circular_progress_indircator.dart';
import 'package:cakuticketapp/View/Widgets/app_error_view.dart';
import 'package:cakuticketapp/Viewmodel/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBuilder extends StatelessWidget {
  const SplashBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) => _builder(context, state),
    );
  }

  _builder(BuildContext context, SplashState state) {
    if (state is SplashInitial) {
      return const AppCircularProgressIndicator();
    } else if (state is SplashErrorState) {
      return AppErrorView(
        message: state.error,
      );
    } else if (state is SplashAuthState) {
      return const AuthScreen();
    } else if (state is SplashHomeState) {
      return Home(model: state.model);
    } else {
      return const AppCircularProgressIndicator();
    }
  }
}
