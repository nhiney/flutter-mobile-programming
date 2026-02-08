import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const InfoText({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '$label: $value',
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
