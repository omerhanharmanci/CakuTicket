import 'package:cakuticketpersonal/Viewmodel/home_cubit/home_cubit.dart';
import 'package:cakuticketpersonal/Viewmodel/request_cubit/request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestFormView extends StatelessWidget {
  const RequestFormView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RequestCubit>();
    return ListView.builder(
      itemCount: cubit.requestList?.length,
      itemBuilder: (context, index) => _itemBuilder(context, index),
    );
  }

  _itemBuilder(BuildContext context, int index) {
    var data = context.read<RequestCubit>().requestList?[index];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(child: Text((index + 1).toString())),
        title: Text(data?.title.toString() ?? " VERİ YOKK"),
        tileColor:
            index % 2 == 0 ? Colors.yellow.shade100 : Colors.green.shade100,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.green, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        onTap: () {
          context.read<HomeCubit>().goHome(data);
        },
      ),
    );
  }
}
