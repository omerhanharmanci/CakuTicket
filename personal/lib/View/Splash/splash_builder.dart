import 'package:cakuticketpersonal/View/Auth/auth_screen.dart';
import 'package:cakuticketpersonal/View/Home/home.dart';
import 'package:cakuticketpersonal/Viewmodel/splash_cubit/splash_cubit.dart';
import 'package:cakuticketpersonal/Widgets/app_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBuilder extends StatelessWidget {
  const SplashBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return _builder(context, state);
      },
    );
  }

  Widget _builder(BuildContext context, SplashState state) {
    if (state is SplashInitial) {
      return const AppCircularProgressIndicator();
    } else if (state is SplashBusyState) {
      return const AppCircularProgressIndicator();
    } else if (state is SplashAuthState) {
      return const AuthScreen();
    } else if (state is SplashHomeState) {
      return Home(
        model: state.model!,
      );
    } else {
      return const AppCircularProgressIndicator();
    }
  }
}
