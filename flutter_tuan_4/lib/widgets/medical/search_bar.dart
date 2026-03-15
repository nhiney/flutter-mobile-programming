import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(12),
      ),

      child: const Row(
        children: [
          Icon(Icons.search),

          SizedBox(width: 10),

          Text("How can we help you?"),
        ],
      ),
    );
  }
}
