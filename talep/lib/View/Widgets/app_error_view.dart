import 'package:flutter/material.dart';

class AppErrorView extends StatelessWidget {
  const AppErrorView({super.key, this.title, this.message, this.code});
  final String? title;
  final String? message;
  final String? code;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? "BILINMEYEN HATA"),
      content: Text(message ?? "BILINMEYEN HATA"),
    );
  }
}
