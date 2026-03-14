import 'package:flutter/material.dart';
import 'campus_screen.dart';
import 'library_screen.dart';
import 'lab_screen.dart';

class FacilityHome extends StatefulWidget {
  const FacilityHome({super.key});

  @override
  State<FacilityHome> createState() => _FacilityHomeState();
}
class _FacilityHomeState extends State<FacilityHome> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    CampusScreen(),
    LibraryScreen(),
    LabScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HUIT Facilities")),

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Campus"),

          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Library",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.computer), label: "Labs"),
        ],
      ),
    );
  }
}
