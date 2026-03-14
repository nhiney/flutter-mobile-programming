import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String exercises;

  const ExerciseCard({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.exercises,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),

            child: Icon(icon, color: Colors.white),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 4),

                Text(exercises, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          const Icon(Icons.more_horiz),
        ],
      ),
    );
  }
}
