import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CalculatorButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isEqual = text == "=";

    return ElevatedButton(
      onPressed: onTap,

      style: ElevatedButton.styleFrom(
        backgroundColor: isEqual ? Colors.blue : Colors.grey[200],

        foregroundColor: isEqual ? Colors.white : Colors.black,

        elevation: 0,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),

      child: Text(text, style: const TextStyle(fontSize: 20)),
    );
  }
}
