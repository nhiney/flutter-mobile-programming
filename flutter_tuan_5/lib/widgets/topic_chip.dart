import 'package:flutter/material.dart';
import 'package:flutter_tuan_5/core/constants/colors.dart';

class TopicChip extends StatelessWidget {
  final String title;

  const TopicChip({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80, 
      height: 80,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.purpleChip, 
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(2, 3)),
        ],
      ),
      child: Text(
        title,
        textAlign: TextAlign.center, 
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
