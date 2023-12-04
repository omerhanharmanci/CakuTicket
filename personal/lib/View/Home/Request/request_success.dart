import 'package:flutter/material.dart';

class RequestSuccess extends StatelessWidget {
  const RequestSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        color: Colors.green,
        size: 400,
        Icons.done,
      ),
    );
  }
}
