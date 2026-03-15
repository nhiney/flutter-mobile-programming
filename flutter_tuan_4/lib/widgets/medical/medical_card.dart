import 'package:flutter/material.dart';

class MedicalCard extends StatelessWidget {
  const MedicalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.pink[200],
        borderRadius: BorderRadius.circular(15),
      ),

      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.purple[200],
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "How do you feel?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),

                const SizedBox(height: 5),

                const Text("Fill out your medical card right now"),

                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Get Started"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
