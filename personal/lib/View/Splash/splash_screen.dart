import 'package:cakuticketpersonal/View/Splash/splash_builder.dart';
import 'package:cakuticketpersonal/Viewmodel/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: const SplashBuilder(),
    );
  }
}
