import 'package:caku_ticket_admin_panel/ViewModel/personal_cubit/personal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalSelectedShow extends StatelessWidget {
  const PersonalSelectedShow({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PersonalCubit>();
    return Column(
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.lightBlue,
                child: Icon(Icons.person_2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                cubit.model?.personalName.toString() ?? "VERİ YOKK",
                style: _textStyle(),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cubit.model?.perosnalMail.toString() ?? "VERİ YOKK",
            style: _textStyle(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cubit.model?.personalUnit.toString() ?? "VERİ YOKK",
            style: _textStyle(),
          ),
        )
      ],
    );
  }

  TextStyle _textStyle() => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
}
