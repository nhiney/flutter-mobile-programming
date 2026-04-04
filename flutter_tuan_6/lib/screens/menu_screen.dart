import 'package:flutter/material.dart';
import 'package:flutter_tuan_6/screens/sinh_vien/home_screen.dart';
import 'package:flutter_tuan_6/screens/todo_app/todo_list_screen.dart';
import 'package:flutter_tuan_6/screens/san_pham/sanpham_list_screen.dart';
import 'package:flutter_tuan_6/screens/chi_tieu/chitieu_list_screen.dart';
import 'package:flutter_tuan_6/screens/auth/login_register_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Soft slate background
      appBar: AppBar(
        title: const Text(
          "HỆ THỐNG BÀI TẬP",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, letterSpacing: 1.5, color: Color(0xFF1E293B)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.black.withOpacity(0.05), height: 1),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.black12, width: 0.5)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F172A).withOpacity(0.05),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      "LẬP TRÌNH DI ĐỘNG",
                      style: TextStyle(color: Color(0xFF0F172A), fontSize: 9, fontWeight: FontWeight.w600, letterSpacing: 1),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Danh mục bài tập",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300, color: Color(0xFF1E293B), letterSpacing: -1),
                  ),
                  const Text(
                    "Tuần 6 - Thiết kế & Trải nghiệm",
                    style: TextStyle(fontSize: 16, color: Colors.black38, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(24),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.85,
                children: [
                  _buildGracefulCard(
                    context,
                    "Sinh viên",
                    "Quản lý thông tin",
                    Icons.school_outlined,
                    const Color(0xFF6366F1),
                    const HomeScreen(),
                  ),
                  _buildGracefulCard(
                    context,
                    "Việc cần làm",
                    "Todo Application",
                    Icons.checklist_rtl_rounded,
                    const Color(0xFF14B8A6),
                    const TodoListScreen(),
                  ),
                  _buildGracefulCard(
                    context,
                    "Sản phẩm",
                    "Quản lý cửa hàng",
                    Icons.shopping_bag_outlined,
                    const Color(0xFFF43F5E),
                    const SanPhamListScreen(),
                  ),
                  _buildGracefulCard(
                    context,
                    "Chi tiêu",
                    "Quản lý tài chính",
                    Icons.account_balance_wallet_outlined,
                    const Color(0xFF3B82F6),
                    const ChiTieuListScreen(),
                  ),
                  _buildGracefulCard(
                    context,
                    "Tài khoản",
                    "Đăng nhập & Đăng ký",
                    Icons.lock_open_rounded,
                    const Color(0xFF64748B),
                    const LoginRegisterScreen(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "V 1.1.0 • GRACEFUL MINIMALIST",
              style: TextStyle(color: Colors.black12, fontSize: 10, fontWeight: FontWeight.w500, letterSpacing: 1),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildGracefulCard(BuildContext context, String title, String subtitle, IconData icon, Color color, Widget screen) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: color.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xFF1E293B)),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11, color: Colors.black38, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
