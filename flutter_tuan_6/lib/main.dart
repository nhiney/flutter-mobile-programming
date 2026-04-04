import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tuan_6/providers/sinh_vien/sinhvien_provider.dart';
import 'package:flutter_tuan_6/providers/todo_app/todo_provider.dart';
import 'package:flutter_tuan_6/providers/san_pham/sanpham_provider.dart';
import 'package:flutter_tuan_6/providers/chi_tieu/chi_tieu_provider.dart';
import 'package:flutter_tuan_6/providers/auth/auth_provider.dart';
import 'package:flutter_tuan_6/screens/menu_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SinhVienProvider()),
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        ChangeNotifierProvider(create: (_) => SanPhamProvider()),
        ChangeNotifierProvider(create: (_) => ChiTieuProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý Sinh viên',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0369A1)),
        useMaterial3: true,
      ),
      home: const MenuScreen(),
    );
  }
}
