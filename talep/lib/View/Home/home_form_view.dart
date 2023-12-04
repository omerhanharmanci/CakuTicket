import 'package:cakuticketapp/View/Unit/unit_drop_down_button.dart';
import 'package:cakuticketapp/View/Widgets/app_text_form_field.dart';
import 'package:cakuticketapp/Viewmodel/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFormView extends StatefulWidget {
  const HomeFormView({super.key});

  @override
  State<HomeFormView> createState() => _HomeFormViewState();
}

class _HomeFormViewState extends State<HomeFormView> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: cubit.titleController,
            labelText: "BAŞLIK",
            hintText: "BAŞLIK",
          ),
          const UnitDropDownButton(),
          AppTextFormField(
            controller: cubit.requestController,
            hintText: "TALEP",
            labelText: "TALEP",
            minLines: 5,
            maxLines: 10,
          ),
          ElevatedButton(
            onPressed: () => cubit.onPressed(),
            child: const Text("GÖNDER"),
          ),
        ],
      ),
    );
  }
}
