import 'package:cakuticketapp/View/Widgets/app_text_form_field.dart';
import 'package:cakuticketapp/Viewmodel/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthFormView extends StatelessWidget {
  const AuthFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Form(
      key: cubit.formkey,
      child: Column(
        children: [
           AppTextFormField(
            controller: cubit.userNameController,
            hintText: "Mail",
            labelText: "Mail",
            keyboardType: TextInputType.name,
          ),
           AppTextFormField(
            controller: cubit.passwordController,
            labelText: "SIFRE",
            hintText: "SIFRE",
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () => cubit.loginOnpressed(),
            child: const Text("GIRIS YAP"),
          ),
        ],
      ),
    );
  }
}
