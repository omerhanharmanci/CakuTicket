import 'package:caku_ticket_admin_panel/Model/UnitAdd/unit_add_screen.dart';
import 'package:caku_ticket_admin_panel/Widgets/app_elevated_button.dart';
import 'package:caku_ticket_admin_panel/view/Personal/personal_screen.dart';
import 'package:caku_ticket_admin_panel/view/Request/request_screen.dart';
import 'package:caku_ticket_admin_panel/view/User/user_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text(
          "ÇAKÜ TALEP ADMİN PANELİ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: AutofillHints.birthdayDay,
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              AppElevatedButton(
                icon: Icons.person,
                text: "KULLANICILAR",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const UserScreen(),
                    ),
                  );
                },
              ),
              AppElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RequestScreen(),
                    ),
                  );
                },
                icon: Icons.request_page,
                text: "TALEPLER",
              ),
              AppElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PersonalScreen(),
                    ),
                  );
                },
                icon: Icons.personal_injury,
                text: "PERSONAL",
              ),
              AppElevatedButton(
                onPressed: ()async{
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UnitAddScreen(),
                    ),
                  );
                },
                icon: Icons.ad_units,
                text: "BİRİM EKLEME",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
