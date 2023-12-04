import 'package:caku_ticket_admin_panel/ViewModel/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<UserCubit>();
    return ListView.builder(
      itemCount: cubit.userList?.length,
      itemBuilder: (context, index) => _itemBuilder(context, index, cubit),
    );
  }

  _itemBuilder(BuildContext context, int index, UserCubit cubit) {
    if (cubit.userList![index] != null) {
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
            cubit.userList![index]?.email.toString() ?? "",
            style: _textStyle(),
          ),
          onTap: () => cubit.listTileOnTap(index),
        ),
      );
    }
  }

  TextStyle _textStyle() {
    return const TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
  }
}
