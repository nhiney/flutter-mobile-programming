import 'package:flutter/material.dart';
import 'package:flutter_tuan_5/core/constants/colors.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String description;

  const CategoryItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.cardBg, 
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black26), 
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: ListTile(
        leading: const Icon(Icons.home),

        title: Text(
          title,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(description),

        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
