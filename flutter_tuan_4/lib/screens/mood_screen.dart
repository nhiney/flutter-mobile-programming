import 'package:flutter/material.dart';
import '../widgets/mood_button.dart';
import '../widgets/exercise_card.dart';

class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: Column(
        children: [
          // HEADER
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),

            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1565C0), Color(0xFF1E88E5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, Nguyen Thi Yen Nhi!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "HUIT - Today",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),

                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // SEARCH
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),

                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: const TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search, color: Colors.white),
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // MOOD TITLE
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "How do you feel?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Icon(Icons.more_horiz, color: Colors.white),
                  ],
                ),

                const SizedBox(height: 15),

                // MOOD BUTTONS
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MoodButton("😢", "Bad"),
                    MoodButton("🙂", "Fine"),
                    MoodButton("😊", "Well"),
                    MoodButton("🤩", "Excellent"),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // EXERCISES TITLE
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Exercises",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                Icon(Icons.more_horiz),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // EXERCISE LIST
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),

              child: Column(
                children: [
                  ExerciseCard(
                    color: Colors.orange,
                    icon: Icons.favorite,
                    title: "Speaking Skills",
                    exercises: "16 Exercises",
                  ),

                  ExerciseCard(
                    color: Colors.green,
                    icon: Icons.person,
                    title: "Reading Skills",
                    exercises: "8 Exercises",
                  ),

                  ExerciseCard(
                    color: Colors.pink,
                    icon: Icons.star,
                    title: "Writing Skills",
                    exercises: "20 Exercises",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),

          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
