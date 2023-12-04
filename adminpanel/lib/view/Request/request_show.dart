import 'package:caku_ticket_admin_panel/ViewModel/request_cubit/request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestShow extends StatelessWidget {
  const RequestShow({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RequestCubit>();
    return Center(
      child: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                cubit.model?.title ?? "VERİ GELMEDİ",
                style: _textStyle(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: Center(
                    child: Text(
                      cubit.model?.request ?? "VERİ YOKK",
                      style: _textStyle(),
                    ),
                  ),
                ),
              ),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              hint: const Text("BİR PERSONEL SEÇİNİZ"),
              items: cubit.allPersonal!
                  .map(
                    (e) => DropdownMenuItem(
                      value: e?.perosnalMail,
                      child: Text(e!.personalName!),
                    ),
                  )
                  .toList(),
              onChanged: (value) => cubit.onChanged(value),
            ),
          ],
        ),
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
