import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tuan_6/models/sinh_vien/sinhvien.dart';
import 'package:flutter_tuan_6/providers/sinh_vien/sinhvien_provider.dart';

class AddSinhVienDialog extends StatefulWidget {
  const AddSinhVienDialog({super.key});

  @override
  State<AddSinhVienDialog> createState() => _AddSinhVienDialogState();
}

class _AddSinhVienDialogState extends State<AddSinhVienDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sinhVienProvider = Provider.of<SinhVienProvider>(context, listen: false);

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Thêm Sinh Viên", 
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Color(0xFF1E1B4B)),
            ),
            const SizedBox(height: 24),
            _buildUnderlineField("Tên Sinh Viên", nameController),
            const SizedBox(height: 20),
            _buildUnderlineField("Email", emailController),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Hủy", style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.w500)),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    String name = nameController.text.trim();
                    String email = emailController.text.trim();
                    if (name.isNotEmpty && email.isNotEmpty) {
                      sinhVienProvider.addSinhVien(SinhVien(name: name, email: email));
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF5F3FF),
                    foregroundColor: const Color(0xFF6366F1),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text("Lưu", style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUnderlineField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black54)),
        TextField(
          controller: controller,
          style: const TextStyle(fontSize: 15, color: Color(0xFF1E293B)),
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 8),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF6366F1), width: 1.5)),
          ),
        ),
      ],
    );
  }
}
