import 'package:flutter/material.dart';

class MusicCover extends StatelessWidget {
  const MusicCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          // ignore: deprecated_member_use
          BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10),
        ],
      ),

      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),

            child: Image.network(
              "https://picsum.photos/400",
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Kota The Friend", style: TextStyle(color: Colors.grey)),

                  Text(
                    "Birdie",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              Icon(Icons.favorite, color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}
