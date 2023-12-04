import 'package:caku_ticket_admin_panel/ViewModel/user_cubit/user_cubit.dart';
import 'package:caku_ticket_admin_panel/Widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAddView extends StatelessWidget {
  const UserAddView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<UserCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: cubit.emailController,
            labelText: "email",
            hintText: "BİR EMAİL GİRİNİZ",
          ),
          AppTextFormField(
            controller: cubit.passwordController,
            labelText: "şifre",
            hintText: "BİR ŞİFRE GİRİNİZ",
          ),
          ElevatedButton(
              onPressed: () => cubit.userAddOnPressed(),
              child: const Text("KAYDET"))
        ],
      ),
    );
  }
}
