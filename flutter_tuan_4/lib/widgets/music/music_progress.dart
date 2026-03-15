import 'package:flutter/material.dart';

class MusicProgress extends StatelessWidget {
  const MusicProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("0:00"),
            Icon(Icons.shuffle),
            Icon(Icons.repeat),
            Text("4:22"),
          ],
        ),

        const SizedBox(height: 10),

        const LinearProgressIndicator(
          value: 0.4,
          minHeight: 6,
          backgroundColor: Colors.grey,
          color: Colors.green,
        ),
      ],
    );
  }
}
