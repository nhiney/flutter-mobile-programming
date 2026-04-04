import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/san_pham/sanpham_provider.dart';
import '../../widgets/san_pham/product_card.dart';
import 'add_sanpham_screen.dart';
import 'sanpham_detail_screen.dart';

class SanPhamListScreen extends StatefulWidget {
  const SanPhamListScreen({super.key});

  @override
  State<SanPhamListScreen> createState() => _SanPhamListScreenState();
}

class _SanPhamListScreenState extends State<SanPhamListScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "CỬA HÀNG",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 14,
            letterSpacing: 3,
            color: Color(0xFF0369A1),
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), shape: BoxShape.circle),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF0369A1), size: 18),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF0F9FF), Color(0xFFE0F2FE), Color(0xFFBAE6FD)],
          ),
        ),
        child: Consumer<SanPhamProvider>(
          builder: (context, provider, _) {
            final products = provider.filteredSanPhams;

            return Column(
              children: [
                const SizedBox(height: 110),
                // Premium Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0369A1).withOpacity(0.08),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: provider.setSearchQuery,
                      style: const TextStyle(fontSize: 14, color: Color(0xFF0369A1), fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        hintText: "Tìm sản phẩm, SKU...",
                        hintStyle: const TextStyle(color: Colors.black12, fontWeight: FontWeight.w500),
                        prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF0EA5E9), size: 22),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear_rounded, size: 18),
                                onPressed: () {
                                  _searchController.clear();
                                  provider.setSearchQuery('');
                                },
                              )
                            : null,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Header Label
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            provider.searchQuery.isEmpty ? "KHÁM PHÁ" : "TRÙNG KHỚP",
                            style: const TextStyle(
                              color: Color(0xFF0EA5E9),
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            provider.searchQuery.isEmpty ? "Sản phẩm mới" : "Kết quả tìm kiếm",
                            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w300, color: Color(0xFF0369A1), letterSpacing: -0.5),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          "${products.length}",
                          style: const TextStyle(color: Color(0xFF0369A1), fontWeight: FontWeight.w900, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Product Grid
                Expanded(
                  child: products.isEmpty
                      ? _buildEmptyState()
                      : GridView.builder(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.65,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final sp = products[index];
                            return TweenAnimationBuilder<double>(
                              duration: Duration(milliseconds: 300 + (index * 50)),
                              tween: Tween(begin: 0.0, end: 1.0),
                              builder: (context, value, child) {
                                return Opacity(
                                  opacity: value,
                                  child: Transform.translate(
                                    offset: Offset(0, 20 * (1 - value)),
                                    child: child,
                                  ),
                                );
                              },
                              child: ProductCard(
                                sanPham: sp,
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => SanPhamDetailScreen(sanPham: sp)),
                                ),
                                onDelete: () async {
                                  final confirm = await showDialog<bool>(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: const Text("Xác nhận xoá"),
                                      content: Text("Bạn có muốn xoá sản phẩm \"${sp.ten}\" không?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(ctx, false),
                                          child: const Text("Không"),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(ctx, true),
                                          child: const Text("Có", style: TextStyle(color: Colors.red)),
                                        ),
                                      ],
                                    ),
                                  );
                                  if (confirm == true) {
                                    provider.deleteSanPham(sp.id!);
                                  }
                                },
                              ),
                            );
                          },
                        ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddSanPhamScreen())),
        backgroundColor: const Color(0xFF0369A1),
        foregroundColor: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: const Icon(Icons.add_rounded, size: 28),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 40)]),
            child: const Icon(Icons.search_off_rounded, size: 64, color: Color(0xFFBAE6FD)),
          ),
          const SizedBox(height: 24),
          const Text("KHÔNG TÌM THẤY", style: TextStyle(color: Color(0xFF0EA5E9), letterSpacing: 3, fontWeight: FontWeight.w900, fontSize: 13)),
          const SizedBox(height: 8),
          const Text("Vui lòng thử từ khóa khác", style: TextStyle(color: Colors.black26, fontSize: 13, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
