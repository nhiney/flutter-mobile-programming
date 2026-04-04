import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tuan_6/models/sinh_vien/sinhvien.dart';
import 'package:flutter_tuan_6/providers/sinh_vien/sinhvien_provider.dart';

class EditSinhVienDialog extends StatefulWidget {
  final SinhVien sinhVien;
  const EditSinhVienDialog({super.key, required this.sinhVien});

  @override
  State<EditSinhVienDialog> createState() => _EditSinhVienDialogState();
}

class _EditSinhVienDialogState extends State<EditSinhVienDialog> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.sinhVien.name);
    emailController = TextEditingController(text: widget.sinhVien.email);
  }

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
              "Thông tin chi tiết của sinh viên", 
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xFF1E1B4B)),
            ),
            const SizedBox(height: 16),
            Text(
              "Dữ liệu: ${widget.sinhVien.id} ${widget.sinhVien.name}",
              style: const TextStyle(fontSize: 12, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            _buildUnderlineField("Tên Sinh Viên", nameController),
            const SizedBox(height: 20),
            _buildUnderlineField("Email", emailController),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    String name = nameController.text.trim();
                    String email = emailController.text.trim();
                    if (name.isNotEmpty && email.isNotEmpty) {
                      sinhVienProvider.updateSinhVien(SinhVien(
                        id: widget.sinhVien.id,
                        name: name,
                        email: email,
                      ));
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Cập nhật", style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.w500)),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Hủy", style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.w500)),
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
        Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.black45)),
        TextField(
          controller: controller,
          style: const TextStyle(fontSize: 14, color: Color(0xFF1E293B)),
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 4),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF6366F1), width: 1.5)),
          ),
        ),
      ],
    );
  }
}
