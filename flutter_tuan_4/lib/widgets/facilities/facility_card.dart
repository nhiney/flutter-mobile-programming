import 'package:flutter/material.dart';

class FacilityCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const FacilityCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),

      child: ListTile(
        leading: Icon(icon, size: 40),

        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

        subtitle: Text(description),
      ),
    );
  }
}
