import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String job;
  final String rating;

  const DoctorCard({
    super.key,
    required this.name,
    required this.job,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.purple[200],
        borderRadius: BorderRadius.circular(15),
      ),

      child: Column(
        children: [
          const CircleAvatar(radius: 30, backgroundColor: Colors.white),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 16, color: Colors.yellow),

              Text(rating),
            ],
          ),

          const SizedBox(height: 5),

          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),

          Text(job),
        ],
      ),
    );
  }
}
