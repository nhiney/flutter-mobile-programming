import 'package:flutter/material.dart';
import 'package:flutter_tuan_5/core/constants/colors.dart';
import '../data/dummy_data.dart';
import '../widgets/topic_chip.dart';
import '../widgets/category_item.dart';

class TopicSelectionScreen extends StatelessWidget {
  const TopicSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryOrange,

        leading: const Icon(Icons.home, color: Colors.black),

        title: const Text(
          'ListView Demo',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== SECTION 1 =====
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            color: AppColors.primaryBlue,
            child: const Text(
              'Chọn loại đề tài',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // ===== TOPIC LIST =====
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: topics.map((t) => TopicChip(title: t.name)).toList(),
            ),
          ),

          const SizedBox(height: 20),

          // ===== SECTION 2 =====
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            color: AppColors.primaryBlue,
            child: const Text(
              'Chọn chuyên ngành thực hiện',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // ===== CATEGORY LIST =====
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final item = categories[index];
                return CategoryItem(
                  title: item.title,
                  description: item.description,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
