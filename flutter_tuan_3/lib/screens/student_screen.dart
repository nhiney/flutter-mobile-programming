import 'package:flutter/material.dart';
import 'teacher_screen.dart';
import '../widgets/info_text.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin sinh viên'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 12),

            // Avatar + shadow
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/student.png'),
              ),
            ),

            const SizedBox(height: 24),

            // Card thông tin sinh viên
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                child: Column(
                  children: const [
                    InfoText(
                      label: 'Họ và tên',
                      value: 'Nguyễn Thị Yến Nhi',
                      color: Colors.blue,
                    ),
                    Divider(),

                    InfoText(
                      label: 'MSSV',
                      value: '2001221234',
                      color: Colors.red,
                    ),
                    Divider(),

                    InfoText(
                      label: 'Lớp',
                      value: '13DHTH02',
                      color: Colors.red,
                    ),
                    Divider(),

                    InfoText(
                      label: 'Khóa',
                      value: '13 Đại học',
                      color: Colors.red,
                    ),
                    Divider(),

                    InfoText(
                      label: 'Ngành',
                      value: 'Công nghệ thông tin',
                      color: Colors.red,
                    ),
                    Divider(),

                    InfoText(
                      label: 'Trường',
                      value: 'ĐH Công Thương TP.HCM',
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 28),

            // Button full width
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TeacherScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Xem thông tin giảng viên',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
