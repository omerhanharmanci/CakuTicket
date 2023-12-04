import 'package:cakuticketpersonal/Viewmodel/auth_cubit/auth_cubit.dart';
import 'package:cakuticketpersonal/Widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthFormView extends StatelessWidget {
  const AuthFormView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return Form(
        key: cubit.formkey,
        child: Column(
          children: [
            AppTextFormField(
              controller: cubit.mailConroller,
              hintText: "EMAİL",
              labelText: "EMAİL",
            ),
            AppTextFormField(
              controller: cubit.passwordController,
              labelText: "ŞİFRE",
              hintText: "ŞİFRE",
            ),
            ElevatedButton(
              onPressed: () => cubit.loginOnPressed(),
              child: const Text("GİRİŞ YAP"),
            ),
          ],
        ));
  }
}
