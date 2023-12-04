import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      this.labelText,
      this.hintText,
      this.obscureText,
      this.controller,
      this.keyboardType, this.minLines, this.maxLines});
  final String? labelText;
  final String? hintText;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) => _validator(value),
        obscureText: obscureText ?? false,
        controller: controller,
        keyboardType: keyboardType,
        minLines: minLines ?? 1,
        maxLines: maxLines ?? 1,
        decoration: _decoration(),
      ),
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      labelText: labelText,
      hintText: hintText,
    );
  }

  _validator(String? value) {
    if (value == null) {
      return "$labelText boş olamaz";
    }

    if (value.length < 10) {
      return "$labelText 10 haneden kısa olamaz";
    }
  }
}
