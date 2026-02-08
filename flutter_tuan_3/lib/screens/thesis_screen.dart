import 'package:flutter/material.dart';

class ThesisScreen extends StatelessWidget {
  const ThesisScreen({super.key});
  static const Color primaryColor = Color(0xFF3F51B5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đề tài đồ án'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.8,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 12),

            Icon(
              Icons.assignment_outlined,
              size: 64,
              color: primaryColor,
            ),

            const SizedBox(height: 20),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
                child: Column(
                  children: const [
                    InfoRow(label: 'Mã đề tài', value: 'DT001'),
                    InfoRow(
                      label: 'Tên đề tài',
                      value: 'Ứng dụng quản lý sinh viên',
                    ),
                    InfoRow(label: 'Số SV tối đa', value: '3 sinh viên'),
                    InfoRow(
                      label: 'Chuyên ngành',
                      value: 'Công nghệ thông tin',
                    ),
                    InfoRow(
                      label: 'GV hướng dẫn',
                      value: 'ThS. Trần Thị A',
                    ),
                    InfoRow(
                      label: 'Yêu cầu',
                      value: 'Flutter cơ bản, OOP, làm việc nhóm',
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                icon: Icon(Icons.arrow_back, color: primaryColor),
                label: Text(
                  'Quay về',
                  style: TextStyle(
                    fontSize: 16,
                    color: primaryColor,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: Colors.grey.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
