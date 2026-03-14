import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String value;

  const Display({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,

      padding: const EdgeInsets.all(20),

      child: Text(
        value,
        style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      ),
    );
  }
}
