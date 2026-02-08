import 'package:flutter/material.dart';
import '../widgets/info_text.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin giảng viên'),
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
                backgroundImage: AssetImage('assets/teacher.png'),
              ),
            ),

            const SizedBox(height: 24),

            // Card thông tin giảng viên
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
                      label: 'Giảng viên',
                      value: 'Trần Thị A',
                      color: Colors.blue,
                    ),
                    Divider(),

                    InfoText(
                      label: 'Khoa',
                      value: 'Công nghệ Thông tin',
                      color: Colors.red,
                    ),
                    Divider(),

                    InfoText(
                      label: 'Học hàm',
                      value: 'Thạc sĩ',
                      color: Colors.red,
                    ),
                    Divider(),

                    InfoText(
                      label: 'Chuyên ngành',
                      value: 'CNPM',
                      color: Colors.green,
                    ),
                    Divider(),

                    InfoText(
                      label: 'Giảng dạy',
                      value:
                          'Nhập môn lập trình, Lập trình Windows, Lập trình Web',
                      color: Colors.blue,
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
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Trở về',
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
