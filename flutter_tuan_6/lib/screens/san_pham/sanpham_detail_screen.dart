import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/san_pham/sanpham.dart';

class SanPhamDetailScreen extends StatelessWidget {
  final SanPham sanPham;

  const SanPhamDetailScreen({super.key, required this.sanPham});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // 1. Immersive Glassmorphic Header
          SliverAppBar(
            expandedHeight: 440.0,
            backgroundColor: Colors.transparent,
            elevation: 0,
            pinned: true,
            leading: _buildGlassAction(
              icon: Icons.arrow_back_ios_new_rounded,
              onTap: () => Navigator.pop(context),
            ),
            actions: [
              _buildGlassAction(
                icon: Icons.share_rounded,
                onTap: () {},
                margin: const EdgeInsets.only(right: 16),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Color(0xFFF0F9FF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Hero(
                  tag: 'product_hero_${sanPham.id}',
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 100, 40, 60),
                      child: _buildProductImage(sanPham.imageUrl),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 2. Sophisticated Content Section
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(48)),
                boxShadow: [
                  BoxShadow(color: Color(0x0A000000), blurRadius: 40, offset: Offset(0, -10)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 40, 32, 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Badge & Category
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(color: const Color(0xFFF0F9FF), borderRadius: BorderRadius.circular(8)),
                          child: const Text("LIMITED", style: TextStyle(color: Color(0xFF0EA5E9), fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
                        ),
                        const SizedBox(width: 8),
                        const Text("• Smart Devices", style: TextStyle(color: Color(0xFF64748B), fontSize: 11, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Product Title
                    Text(
                      sanPham.ten,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF0F172A),
                        letterSpacing: -0.5,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Pricing Section: Sophisticated Thin Stack
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          sanPham.formattedGia,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w200,
                            color: Color(0xFF0369A1),
                            letterSpacing: -0.5,
                          ),
                        ),
                        if (sanPham.giamGia > 0) ...[
                          const SizedBox(width: 16),
                          Text(
                            NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(sanPham.gia + sanPham.giamGia),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFF94A3B8),
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ]
                      ],
                    ),
                    const SizedBox(height: 48),

                    // Elite Stats Grid (TAX, SKU, STATUS)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatCard("THUẾ NK", "10%", Icons.shield_outlined),
                        _buildStatCard("TRẠNG THÁI", "Sẵn có", Icons.check_circle_outline_rounded),
                        _buildStatCard("SKU", sanPham.ma, Icons.qr_code_2_rounded),
                      ],
                    ),
                    const SizedBox(height: 48),

                    // Detailed Breakdown Section
                    const Text("DANH MỤC CHI TIẾT", style: TextStyle(color: Color(0xFF475569), fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 2)),
                    const SizedBox(height: 24),
                    _buildStepRow("Đơn giá gốc", sanPham.formattedGia, false),
                    _buildStepRow("Chiết khấu (Coupon)", "- ${sanPham.formattedGiamGia}", true),
                    _buildStepRow("Thuế nhập khẩu", "+ ${sanPham.formattedTax}", false),
                    const Divider(height: 48, color: Color(0xFFF1F5F9)),
                    
                    const SizedBox(height: 20),
                    // Product Description Placeholder
                    const Text(
                      "Sản phẩm được bảo hành chính hãng. Miễn phí vận chuyển cho đơn hàng trên 2 triệu đồng. Hỗ trợ trả góp 0% qua thẻ tín dụng.",
                      style: TextStyle(color: Color(0xFF64748B), fontSize: 14, height: 1.6, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildEliteBottomBar(),
    );
  }

  Widget _buildGlassAction({required IconData icon, required VoidCallback onTap, EdgeInsets margin = const EdgeInsets.only(left: 16)}) {
    return Container(
      margin: margin.copyWith(top: 8, bottom: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.4), border: Border.all(color: Colors.white.withOpacity(0.2))),
            child: IconButton(icon: Icon(icon, color: const Color(0xFF0F172A), size: 20), onPressed: onTap),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFF1F5F9)),
        ),
        child: Column(
          children: [
            Icon(icon, size: 20, color: const Color(0xFF94A3B8)),
            const SizedBox(height: 12),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w900, color: Color(0xFF0F172A), fontSize: 13)),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(color: Color(0xFF64748B), fontSize: 8, fontWeight: FontWeight.w800, letterSpacing: 0.5)),
          ],
        ),
      ),
    );
  }

  Widget _buildStepRow(String label, String value, bool isRed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF64748B), fontSize: 14, fontWeight: FontWeight.w500)),
          Text(value, style: TextStyle(color: isRed ? const Color(0xFFEF4444) : const Color(0xFF0F172A), fontSize: 14, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  Widget _buildEliteBottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 40),
      color: Colors.white,
      child: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: const Color(0xFF0F172A).withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("TỔNG THANH TOÁN", style: TextStyle(color: Colors.white54, fontSize: 8, fontWeight: FontWeight.w800, letterSpacing: 2)),
                const SizedBox(height: 2),
                Text(sanPham.formattedTotal, style: const TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w300, letterSpacing: -0.5)),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(color: const Color(0xFF0EA5E9), borderRadius: BorderRadius.circular(16)),
              child: const Text("Mua ngay", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(String path) {
    if (path.startsWith('assets/')) {
      return Image.asset(path, fit: BoxFit.contain);
    }
    return Image.file(
      File(path),
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) => const Icon(Icons.broken_image_outlined, color: Colors.black12, size: 80),
    );
  }
}

