import 'package:caku_ticket_admin_panel/Services/firebase_options.dart';
import 'package:caku_ticket_admin_panel/view/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        title: "CAKUTICKETAPP ADMİN PANEL",
        home: const Home(),
      ),
    );
  }
}
