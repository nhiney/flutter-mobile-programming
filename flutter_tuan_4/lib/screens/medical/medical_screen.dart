import 'package:flutter/material.dart';
import '../../widgets/medical/medical_card.dart';
import '../../widgets/medical/search_bar.dart';
import '../../widgets/medical/category_item.dart';
import '../../widgets/medical/doctor_card.dart';

class MedicalScreen extends StatelessWidget {
  const MedicalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello"),

                      SizedBox(height: 4),

                      Text(
                        "Mitch Koo",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const MedicalCard(),

              const SizedBox(height: 20),

              const SearchBarWidget(),

              const SizedBox(height: 20),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryItem(icon: Icons.medical_services, title: "Dentist"),

                  CategoryItem(icon: Icons.person, title: "Surgeon"),

                  CategoryItem(icon: Icons.local_hospital, title: "Pharmacist"),
                ],
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Doctor list",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  Text("See all"),
                ],
              ),

              const SizedBox(height: 15),

              const Row(
                children: [
                  DoctorCard(
                    name: "Dr Mitch Koo",
                    job: "Psychologist",
                    rating: "4.4",
                  ),

                  SizedBox(width: 15),

                  DoctorCard(
                    name: "Dr Steve Jobs",
                    job: "Surgeon",
                    rating: "5.0",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
