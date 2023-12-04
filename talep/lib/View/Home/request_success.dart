import 'package:flutter/material.dart';

class RequestSuccess extends StatelessWidget {
  const RequestSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: const Icon(
        Icons.done,
        color: Colors.green,
        size: 200,
      ),
    );
  }
}
