import 'package:flutter/material.dart';

class AppDropDownButton extends StatelessWidget {
  const AppDropDownButton(
      {super.key, required this.onChanged, required this.items});
  final ValueChanged<String?> onChanged;
  final List<DropdownMenuItem> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
        decoration: _decoration(),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        hint: const Text("BİR BİRİM SEÇİNİZ"),
        items: items,
        onChanged: (value) => onChanged(value as String?),
      ),
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
