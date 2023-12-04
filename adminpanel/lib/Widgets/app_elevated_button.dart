import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton(
      {super.key, required this.onPressed, this.icon, this.text});
  final VoidCallback onPressed;
  final IconData? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: ElevatedButton(
        
        onPressed: onPressed,
      
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 200),
          side: const BorderSide(),
          
        ),
        child: Column(
          children: [
            Icon(icon ?? Icons.error,size: 50),
            Text(
              text ?? "hata",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
