import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),

          decoration: BoxDecoration(
            color: Colors.purple[200],
            borderRadius: BorderRadius.circular(12),
          ),

          child: Icon(icon),
        ),

        const SizedBox(height: 8),

        Text(title),
      ],
    );
  }
}
