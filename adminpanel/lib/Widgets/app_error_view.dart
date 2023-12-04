import 'package:flutter/material.dart';

class AppErrorView extends StatelessWidget {
  const AppErrorView({super.key, this.title, this.content});
  final String? title, content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? "BİLİNMEYEN HATA"),
      content: Text(content ?? "HATA"),
    );
  }
}
