import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(icon, color: Colors.blue),
      ),

      title: Text(title),

      subtitle: Text(subtitle),

      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
