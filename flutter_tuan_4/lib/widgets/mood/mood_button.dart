import 'package:flutter/material.dart';

class MoodButton extends StatelessWidget {
  final String emoji;
  final String text;

  const MoodButton(this.emoji, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),

          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(12),
          ),

          child: Text(emoji, style: const TextStyle(fontSize: 28)),
        ),

        const SizedBox(height: 5),

        Text(text, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
