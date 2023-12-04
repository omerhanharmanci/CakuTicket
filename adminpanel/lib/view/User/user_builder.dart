import 'package:caku_ticket_admin_panel/ViewModel/user_cubit/user_cubit.dart';
import 'package:caku_ticket_admin_panel/Widgets/app_circular_progress_indicator.dart';
import 'package:caku_ticket_admin_panel/Widgets/app_error_view.dart';
import 'package:caku_ticket_admin_panel/view/User/user_add_view.dart';
import 'package:caku_ticket_admin_panel/view/User/user_selected_user_show.dart';
import 'package:caku_ticket_admin_panel/view/User/user_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBuilder extends StatelessWidget {
  const UserBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<UserCubit>();
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("KULLANICI"),
        ),
        body: _userBuilder(context, state),
        floatingActionButton: FloatingActionButton(
          onPressed: () => cubit. 
          goAddUser(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  _userBuilder(BuildContext context, UserState state) {
    if (state is UserBusyState) {
      return const AppCircularProgressIndicator();
    } else if (state is UserErrorState) {
      return AppErrorView(content: state.error);
    } else if (state is UserInitial) {
      return const AppCircularProgressIndicator();
    } else if (state is UserAddState) {
      return const UserAddView();
    } else if (state is UserShowState) {
      return const UserView();
    } else if (state is UserSelectedUserState) {
      return const UserSelectedUserShow();
    }
  }
}
