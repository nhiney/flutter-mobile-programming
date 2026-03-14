import 'package:flutter/material.dart';
import 'calculator_screen.dart';
import 'facility_home.dart';
import 'mood_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Assignments")),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text("Bài 1 - Calculator"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CalculatorScreen()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.school),
            title: const Text("Bài 2 - HUIT Facilities"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FacilityHome()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.emoji_emotions),
            title: const Text("Bài 3 - Daily Mood"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MoodScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
