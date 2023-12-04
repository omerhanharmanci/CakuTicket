import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;

  final String? labelText;

  final String? hintText;

  const AppTextFormField(
      {super.key, this.controller, this.labelText, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        controller: controller,
        validator: (value) => _validator(value),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  _validator(String? value) {
    if (value == null) {
      return "LÜTFEN BİR DEĞER GİRİNİZ";
    } else if (value.length < 10) {
      return "EN AZ 10 KARAKTER OLMALI";
    }
  }
}
