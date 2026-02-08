import 'package:flutter/material.dart';

class MajorButtonScreen extends StatefulWidget {
  const MajorButtonScreen({super.key});

  @override
  State<MajorButtonScreen> createState() => _MajorButtonScreenState();
}
class _MajorButtonScreenState extends State<MajorButtonScreen> {
  String selectedMajor = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giới thiệu ngành học'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// BUTTONS
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedMajor = 'CNTT';
                      });
                    },
                    child: const Text('Công nghệ Thông tin'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedMajor = 'ATTT';
                      });
                    },
                    child: const Text('An toàn Thông tin'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            /// CONTENT
            Expanded(
              child: _buildMajorContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMajorContent() {
    if (selectedMajor == 'CNTT') {
      return _buildCard(
        title: 'Ngành Công nghệ Thông tin',
        icon: Icons.computer,
        description:
            'Ngành Công nghệ Thông tin đào tạo sinh viên các kiến thức nền tảng '
            'và chuyên sâu về lập trình, phát triển phần mềm, cơ sở dữ liệu '
            'và các hệ thống công nghệ hiện đại.',
        details: const [
          'Lập trình Web & Mobile',
          'Cơ sở dữ liệu',
          'Trí tuệ nhân tạo',
          'Phát triển phần mềm',
        ],
      );
    }

    if (selectedMajor == 'ATTT') {
      return _buildCard(
        title: 'Ngành An toàn Thông tin',
        icon: Icons.security,
        description:
            'Ngành An toàn Thông tin tập trung đào tạo về bảo mật hệ thống, '
            'an ninh mạng, phòng chống tấn công mạng và bảo vệ dữ liệu.',
        details: const [
          'An ninh mạng',
          'Mã hóa dữ liệu',
          'Bảo mật hệ thống',
          'Kiểm thử xâm nhập',
        ],
      );
    }

    return const Center(
      child: Text(
        'Vui lòng chọn một ngành để xem thông tin',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required IconData icon,
    required String description,
    required List<String> details,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 32),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(description),
            const SizedBox(height: 12),
            const Text(
              'Nội dung đào tạo tiêu biểu:',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            ...details.map(
              (item) => Padding(
                padding: const EdgeInsets.only(left: 8, top: 4),
                child: Row(
                  children: [
                    const Icon(Icons.check, size: 16),
                    const SizedBox(width: 6),
                    Expanded(child: Text(item)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
