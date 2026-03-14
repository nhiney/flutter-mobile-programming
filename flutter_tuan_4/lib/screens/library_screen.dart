import 'package:flutter/material.dart';
import '../widgets/facility_card.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),

      children: const [
        FacilityCard(
          title: "Central Library",
          description: "Thousands of books, study rooms and digital resources.",
          icon: Icons.menu_book,
        ),

        FacilityCard(
          title: "Study Area",
          description: "Quiet environment for research and studying.",
          icon: Icons.local_library,
        ),
      ],
    );
  }
}
