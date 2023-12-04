import 'package:caku_ticket_admin_panel/ViewModel/personal_cubit/personal_cubit.dart';
import 'package:caku_ticket_admin_panel/view/Personal/personal_builder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  final TextEditingController _personalNameController = TextEditingController();
  final TextEditingController _personalMailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalCubit(
        _personalNameController,
        _personalMailController,
        _passwordController,
        _formKey,
      ),
      child: const PersonalBuilder(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _formKey.currentState!.dispose();
    _personalMailController.dispose();
    _personalNameController.dispose();
  }
}
