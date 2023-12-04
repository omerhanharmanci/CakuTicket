import 'package:cakuticketpersonal/View/Home/Request/request_form_view.dart';
import 'package:cakuticketpersonal/View/Home/Request/request_success.dart';
import 'package:cakuticketpersonal/Viewmodel/request_cubit/request_cubit.dart';
import 'package:cakuticketpersonal/Widgets/app_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestBuilder extends StatelessWidget {
  const RequestBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestCubit, RequestState>(
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.black))),
          width: MediaQuery.of(context).size.width * 0.2,
          child: _builder(context, state),
        );
      },
    );
  }

  _builder(BuildContext context, RequestState state) {
    if (state is RequestInitial) {
      return const AppCircularProgressIndicator();
    } else if (state is RequestErrorState) {
      return Text(state.error.toString());
    } else if (state is RequestFormState) {
      return const RequestFormView();
    } else if(state is RequestDoneState){
      return const RequestSuccess();
    } 
    
    else {
      return const AppCircularProgressIndicator();
    } 
  }
}
