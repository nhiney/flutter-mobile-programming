import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../models/san_pham/sanpham.dart';
import '../../providers/san_pham/sanpham_provider.dart';

class AddSanPhamScreen extends StatefulWidget {
  const AddSanPhamScreen({super.key});

  @override
  State<AddSanPhamScreen> createState() => _AddSanPhamScreenState();
}

class _AddSanPhamScreenState extends State<AddSanPhamScreen> {
  final _formKey = GlobalKey<FormState>();
  final _maController = TextEditingController();
  final _tenController = TextEditingController();
  final _giaController = TextEditingController();
  final _giamGiaController = TextEditingController();
  
  String? _selectedImagePath;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  @override
  void dispose() {
    _maController.dispose();
    _tenController.dispose();
    _giaController.dispose();
    _giamGiaController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImagePath = image.path;
      });
    }
  }

  Future<void> _save() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      
      // Simulate network/db processing for premium UX feel
      await Future.delayed(const Duration(milliseconds: 800));

      final sp = SanPham(
        ma: _maController.text.trim(),
        ten: _tenController.text.trim(),
        gia: double.tryParse(_giaController.text) ?? 0.0,
        giamGia: double.tryParse(_giamGiaController.text) ?? 0.0,
        imageUrl: _selectedImagePath ?? 'assets/images/placeholder.png',
      );

      if (!mounted) return;
      
      try {
        await Provider.of<SanPhamProvider>(context, listen: false).addSanPham(sp);
        
        if (!mounted) return;
        
        // Success Feedback
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle_rounded, color: Colors.white, size: 20),
                const SizedBox(width: 12),
                const Text("Tạo sản phẩm thành công!", style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
            backgroundColor: const Color(0xFF0EA5E9),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.all(24),
            duration: const Duration(seconds: 2),
          ),
        );

        Navigator.pop(context);
      } catch (e) {
        setState(() => _isLoading = false);
        // Error Feedback if needed
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F9FF), // Light Pastel Blue Background
      appBar: AppBar(
        title: const Text(
          "THÊM SẢN PHẨM",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 14,
            letterSpacing: 2,
            color: Color(0xFF0F172A), // Deep Navy
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF0EA5E9), size: 16),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 60),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // 1. Apple-Style Image Preview Area
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(color: const Color(0x0A000000), blurRadius: 40, offset: const Offset(0, 10)),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: _selectedImagePath == null 
                        ? Column(
                            key: const ValueKey('empty'),
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF0F9FF),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: const Icon(Icons.add_a_photo_outlined, size: 32, color: Color(0xFF0EA5E9)),
                              ),
                              const SizedBox(height: 16),
                              const Text("CHỌN ẢNH SẢN PHẨM", style: TextStyle(color: Color(0xFF0EA5E9), fontSize: 10, fontWeight: FontWeight.w600, letterSpacing: 2)),
                            ],
                          )
                        : Stack(
                            key: const ValueKey('loaded'),
                            fit: StackFit.expand,
                            children: [
                              Image.file(File(_selectedImagePath!), fit: BoxFit.cover),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.transparent, Colors.black.withOpacity(0.4)],
                                  ),
                                ),
                              ),
                              const Center(
                                child: Icon(Icons.sync_rounded, color: Colors.white70, size: 40),
                              ),
                            ],
                          ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 2. Main High-End Form Card (Shopee Style)
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(color: const Color(0x08000000), blurRadius: 40, offset: const Offset(0, 10)),
                  ],
                ),
                child: Column(
                  children: [
                    _buildSeniorField("Mã sản phẩm", _maController, "Ví dụ: SKU-999", Icons.qr_code_rounded),
                    const SizedBox(height: 24),
                    _buildSeniorField("Tên sản phẩm", _tenController, "Tên hiển thị trên Store...", Icons.inventory_2_outlined),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Divider(color: Color(0xFFF1F5F9), thickness: 1),
                    ),
                    Row(
                      children: [
                        Expanded(child: _buildSeniorField("Giá niêm yết", _giaController, "0", Icons.payments_outlined, isNumber: true)),
                        const SizedBox(width: 16),
                        Expanded(child: _buildSeniorField("Giảm giá", _giamGiaController, "0", Icons.local_offer_outlined, isNumber: true)),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),

              // 3. Senior Action Button (With Loading)
              GestureDetector(
                onTap: _isLoading ? null : _save,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: double.infinity,
                  height: 64,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: _isLoading 
                        ? [const Color(0xFF94A3B8), const Color(0xFFCBD5E1)]
                        : [const Color(0xFF0369A1), const Color(0xFF0EA5E9)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: (_isLoading ? Colors.transparent : const Color(0xFF0EA5E9)).withOpacity(0.3), 
                        blurRadius: 15, 
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Center(
                    child: _isLoading 
                      ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_circle_outline_rounded, color: Colors.white, size: 20),
                            SizedBox(width: 12),
                            Text("HOÀN TẤT THÊM", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, letterSpacing: 2, fontSize: 13)),
                          ],
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSeniorField(String label, TextEditingController controller, String hint, IconData icon, {bool isNumber = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: Color(0xFF475569), letterSpacing: 1.5)),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFF1F5F9)),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            style: const TextStyle(fontSize: 15, color: Color(0xFF0F172A), fontWeight: FontWeight.w500),
            validator: (value) {
              if (value == null || value.trim().isEmpty) return "Bắt buộc";
              if (isNumber && double.tryParse(value) == null) return "Phải là số";
              return null;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: const Color(0xFF0EA5E9), size: 18),
              hintText: hint,
              hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13, fontWeight: FontWeight.w400),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              errorStyle: const TextStyle(fontSize: 9, height: 0.5),
            ),
          ),
        ),
      ],
    );
  }
}
