import 'package:flutter/material.dart';
import '../widgets/facility_card.dart';

class LabScreen extends StatelessWidget {
  const LabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),

      children: const [
        FacilityCard(
          title: "Computer Lab",
          description:
              "Equipped with modern PCs for programming and AI research.",
          icon: Icons.computer,
        ),

        FacilityCard(
          title: "IoT Lab",
          description: "Research space for embedded systems and smart devices.",
          icon: Icons.memory,
        ),
      ],
    );
  }
}
