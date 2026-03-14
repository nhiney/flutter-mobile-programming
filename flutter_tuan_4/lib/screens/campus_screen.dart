import 'package:flutter/material.dart';
import '../widgets/facility_card.dart';

class CampusScreen extends StatelessWidget {
  const CampusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),

      children: const [
        FacilityCard(
          title: "Main Campus",
          description:
              "Modern campus with lecture halls, green parks and student spaces.",
          icon: Icons.location_city,
        ),

        FacilityCard(
          title: "Sports Center",
          description: "Gym, football field, basketball court for students.",
          icon: Icons.sports_soccer,
        ),
      ],
    );
  }
}
