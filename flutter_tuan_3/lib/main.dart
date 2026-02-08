import 'package:flutter/material.dart';
//import 'package:flutter_tuan_3/screens/group_screen.dart';
import 'package:flutter_tuan_3/screens/major_intro_screen.dart';
//import 'package:flutter_tuan_3/screens/student_screen.dart';
//import 'screens/thesis_screen.dart';
//import 'screens/product_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài tập tuần 03 - flutter',
      //home: const StudentScreen(),
      //home: ThesisScreen(),
      //home: ProductListScreen(),
      //home: GroupScreen(),
       home: MajorButtonScreen(),
    );
  }
}
