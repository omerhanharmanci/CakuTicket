import 'package:caku_ticket_admin_panel/Model/UnitAdd/unit_add_builder.dart';
import 'package:caku_ticket_admin_panel/ViewModel/unit_add_cubit/unit_add_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitAddScreen extends StatefulWidget {
  const UnitAddScreen({super.key});

  @override
  State<UnitAddScreen> createState() => _UnitAddScreenState();
}

class _UnitAddScreenState extends State<UnitAddScreen> {
  final TextEditingController _unitController = TextEditingController();

  final TextEditingController _unitPartController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UnitAddCubit(
        _unitController,
        _unitPartController,
        _formKey,
      ),
      child: const UnitAddBuilder(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _formKey.currentState!.dispose();
    _unitController.dispose();
    _unitPartController.dispose();
  }
}
