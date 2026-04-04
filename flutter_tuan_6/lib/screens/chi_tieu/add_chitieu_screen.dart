import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/chi_tieu/chi_tieu.dart';
import '../../providers/chi_tieu/chi_tieu_provider.dart';

class AddChiTieuScreen extends StatefulWidget {
  const AddChiTieuScreen({super.key});

  @override
  State<AddChiTieuScreen> createState() => _AddChiTieuScreenState();
}

class _AddChiTieuScreenState extends State<AddChiTieuScreen> {
  final _noiDungController = TextEditingController();
  final _soTienController = TextEditingController();
  final _ghiChuController = TextEditingController();
  String _selectedCategory = "Ăn uống";

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Ăn uống', 'icon': Icons.restaurant_outlined},
    {'name': 'Di chuyển', 'icon': Icons.directions_bus_outlined},
    {'name': 'Mua sắm', 'icon': Icons.shopping_bag_outlined},
    {'name': 'Tiền nhà', 'icon': Icons.home_work_outlined},
    {'name': 'Hóa đơn', 'icon': Icons.receipt_long_outlined},
    {'name': 'Y tế', 'icon': Icons.local_hospital_outlined},
    {'name': 'Khác', 'icon': Icons.category_outlined},
  ];

  void _save() {
    if (_noiDungController.text.isEmpty || _soTienController.text.isEmpty) return;
    
    final ct = ChiTieu(
      noiDung: _noiDungController.text,
      soTien: double.parse(_soTienController.text),
      ghiChu: _ghiChuController.text,
      category: _selectedCategory,
    );
    
    Provider.of<ChiTieuProvider>(context, listen: false).addChiTieu(ct);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text("THÊM CHI TIÊU", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, letterSpacing: 2, color: Colors.black45)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black45,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGracefulLabel("NỘI DUNG CHI TIÊU"),
            const SizedBox(height: 12),
            _buildGracefulInput(_noiDungController, "Nhập nội dung...", Icons.edit_note_rounded),
            
            const SizedBox(height: 24),
            _buildGracefulLabel("SỐ TIỀN (VNĐ)"),
            const SizedBox(height: 12),
            _buildGracefulInput(_soTienController, "0", Icons.payments_outlined, isNumber: true),
            
            const SizedBox(height: 24),
            _buildGracefulLabel("DANH MỤC"),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final cat = _categories[index];
                  bool isSelected = _selectedCategory == cat['name'];
                  return GestureDetector(
                    onTap: () => setState(() => _selectedCategory = cat['name']),
                    child: Container(
                      width: 80,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF0F172A) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(cat['icon'], color: isSelected ? Colors.white : Colors.black26, size: 24),
                          const SizedBox(height: 8),
                          Text(
                            cat['name'],
                            style: TextStyle(color: isSelected ? Colors.white60 : Colors.black26, fontSize: 10, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 24),
            _buildGracefulLabel("GHI CHÚ"),
            const SizedBox(height: 12),
            _buildGracefulInput(_ghiChuController, "Thêm ghi chú...", Icons.notes_rounded, maxLines: 3),
            
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F172A),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 8,
                  shadowColor: const Color(0xFF0F172A).withOpacity(0.3),
                ),
                child: const Text("LƯU CHI TIÊU", style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 1.5, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGracefulLabel(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.black26, letterSpacing: 1),
    );
  }

  Widget _buildGracefulInput(TextEditingController controller, String hint, IconData icon, {bool isNumber = false, int maxLines = 1}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        maxLines: maxLines,
        style: const TextStyle(fontSize: 15, color: Color(0xFF1E293B)),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black12),
          prefixIcon: Icon(icon, color: Colors.black12, size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(20),
        ),
      ),
    );
  }
}
