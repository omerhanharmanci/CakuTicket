import 'package:cakuticketpersonal/Viewmodel/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestShow extends StatelessWidget {
  const RequestShow({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: cubit.selectedRequest != null
          ? Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              cubit.selectedRequest?.title.toString() ??
                                  "VERİ HATALI GELDİ",
                              style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                      Text(
                        cubit.selectedRequest?.request.toString() ??
                            "VERİ HATALI GELDİ",
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: cubit.requestController,
                  minLines: 5,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: "ÇÖZÜM",
                    hintText: "SORUNUN ÇÖZÜMÜNÜ YAZ",
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(
                    onPressed: () => cubit.updateRequest(),
                    child: const Text("KAYDET")),
              ],
            )
          : const Center(
              child: Text("BİR TALEP SEÇİNİZ"),
            ),
    );
  }
}
