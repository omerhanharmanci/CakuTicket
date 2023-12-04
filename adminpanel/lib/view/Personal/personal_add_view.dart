import 'package:caku_ticket_admin_panel/ViewModel/personal_cubit/personal_cubit.dart';
import 'package:caku_ticket_admin_panel/Widgets/app_text_form_field.dart';
import 'package:caku_ticket_admin_panel/view/Personal/Unit/unit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalAddView extends StatelessWidget {
  const PersonalAddView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PersonalCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: cubit.personalNameController,
            hintText: "PERSONAL İSMİ",
            labelText: "PERSONEL İSMİ",
          ),
          AppTextFormField(
            controller: cubit.personalMailController,
            hintText: "PERSONAL MAİL",
            labelText: "PERSONAL MAİL",
          ),
          AppTextFormField(
            controller: cubit.passwordController,
          ),
          const UnitScreen(),
          ElevatedButton(
            onPressed: () => cubit.addPersonalOnPressed(),
            child: const Text("EKLE"),
          ),
        ],
      ),
    );
  }
}
