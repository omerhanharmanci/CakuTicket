import 'package:caku_ticket_admin_panel/ViewModel/personal_cubit/personal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalShowView extends StatelessWidget {
  const PersonalShowView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PersonalCubit>();
    return ListView.builder(
      itemCount: cubit.personalList?.length,
      itemBuilder: (context, index) => _itemBuilder(context, index, cubit),
    );
  }

  _itemBuilder(BuildContext context, int index, PersonalCubit cubit) {
    var data = cubit.personalList?[index];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: (index + 1) % 2 == 0 ? Colors.lightBlue : Colors.blueGrey,
        contentPadding: const EdgeInsets.all(10),
        titleAlignment: ListTileTitleAlignment.center,
        trailing: const Icon(Icons.arrow_right),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              (index + 1).toString(),
              style: _textStyle(),
            ),
          ),
        ),
        title: Text(
          cubit.personalList![index]?.personalName.toString() ?? "",
          style: _textStyle(),
        ),
        onTap: () => cubit.personalOnTap(data),
      ),
    );
  }

  TextStyle _textStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }
}
