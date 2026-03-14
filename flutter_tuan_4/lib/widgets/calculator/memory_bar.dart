import 'package:flutter/material.dart';

class MemoryBar extends StatelessWidget {
  const MemoryBar({super.key});

  @override
  Widget build(BuildContext context) {
    final items = ["MC", "MR", "M+", "M-", "MS", "Mv"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items.map((e) {
        return Text(
          e,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        );
      }).toList(),
    );
  }
}
