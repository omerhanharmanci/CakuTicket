import 'package:caku_ticket_admin_panel/ViewModel/request_cubit/request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestAllShow extends StatelessWidget {
  const RequestAllShow({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RequestCubit>();
    return ListView.builder(
      itemCount: cubit.requestList?.length,
      itemBuilder: (context, index) => _itemBuiler(context, index, cubit),
    );
  }

  _itemBuiler(BuildContext context, int index, RequestCubit cubit) {
    var data = cubit.requestList?[index];
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
          cubit.requestList![index]?.title.toString() ?? "",
          style: _textStyle(),
        ),
        onTap: () => cubit.requestOnTap(data),
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
