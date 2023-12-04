import 'package:caku_ticket_admin_panel/ViewModel/unit_add_cubit/unit_add_cubit.dart';
import 'package:caku_ticket_admin_panel/Widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitAddFormView extends StatelessWidget {
  const UnitAddFormView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<UnitAddCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: cubit.unitController,
            labelText: "BİRİM",
            hintText: "BİR BİRİM GİRİNİZ",
          ),
          AppTextFormField(
            controller: cubit.unitPartController,
            labelText: "KISIMLAR",
            hintText: "KISIMLARI ARALARINDA VİRGÜL OLACAK ŞEKİLDE SIRALAYINIZ",
          ),

          ElevatedButton(onPressed: () => cubit.unitAddOnPressed(), child: const Text("EKLE"),),
        ],
      ),
    );
  }
}
