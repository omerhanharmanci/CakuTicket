import 'package:cakuticketapp/View/Home/home_form_view.dart';
import 'package:cakuticketapp/View/Home/request_success.dart';
import 'package:cakuticketapp/View/Widgets/app_circular_progress_indircator.dart';
import 'package:cakuticketapp/View/Widgets/app_error_view.dart';
import 'package:cakuticketapp/Viewmodel/home_cubit/home_cubit.dart';
import 'package:cakuticketapp/Viewmodel/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBuilder extends StatelessWidget {
  const HomeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(" ANASAYFA"),
          actions: [
            IconButton(
                onPressed: () => context.read<SplashCubit>().goAuth(),
                icon: const Icon(Icons.arrow_back_ios)),
          ],
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) => _bodyBuilder(context, state),
          ),
        ));
  }

  _bodyBuilder(BuildContext context, HomeState state) {
    if (state is HomeBusyState) {
      return const AppCircularProgressIndicator();
    } else if (state is HomeErrorState) {
      return AppErrorView(
        message: state.message,
      );
    } else if (state is HomeDoneState) {
      return const RequestSuccess();
    } else if (state is HomeFormState) {
      return const HomeFormView();
    }
  }
}
