import 'package:flutter/material.dart';

class AppErrorView extends StatelessWidget {
  const AppErrorView({super.key, this.message});
  final String? message;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(message ?? "HATA BİLİNMİYOR!!!"),
    );
  }
}
