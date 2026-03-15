import 'package:flutter/material.dart';
import 'calculator/calculator_screen.dart';
import 'facilities/facility_home.dart';
import 'mood/mood_screen.dart';
import 'wallet/wallet_screen.dart';
import 'medical/medical_screen.dart'; 

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

          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: const Text("Bài 4 - E Wallet"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const WalletScreen()),
              );
            },
          ),

          /// ⭐ Bài 5
          ListTile(
            leading: const Icon(Icons.local_hospital),
            title: const Text("Bài 5 - Medical Appointment"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MedicalScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
