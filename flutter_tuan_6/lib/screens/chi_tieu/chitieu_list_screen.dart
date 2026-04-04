import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/chi_tieu/chi_tieu_provider.dart';
import 'add_chitieu_screen.dart';

class ChiTieuListScreen extends StatefulWidget {
  const ChiTieuListScreen({super.key});

  @override
  State<ChiTieuListScreen> createState() => _ChiTieuListScreenState();
}

class _ChiTieuListScreenState extends State<ChiTieuListScreen> {
  String _selectedFilter = "Tất cả";

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ChiTieuProvider>(context, listen: false).loadChiTieus());
  }

  String _formatCurrency(double amount) {
    String s = amount.toStringAsFixed(0);
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    return s.replaceAllMapped(reg, (Match m) => '${m[1]}.') + " đ";
  }

  Map<String, dynamic> _getGracefulIconData(String noiDung, String category) {
    final String text = noiDung.toLowerCase();
    
    if (text.contains('xăng') || text.contains('dầu')) {
      return {'icon': Icons.local_gas_station_outlined, 'color': const Color(0xFF3B82F6)};
    }
    if (text.contains('ăn') || text.contains('uống') || text.contains('cafe')) {
      return {'icon': Icons.restaurant_outlined, 'color': const Color(0xFFF59E0B)};
    }
    if (text.contains('xe') || text.contains('di chuyển')) {
      return {'icon': Icons.directions_car_outlined, 'color': const Color(0xFF6366F1)};
    }
    if (text.contains('mua') || text.contains('sắm')) {
      return {'icon': Icons.shopping_bag_outlined, 'color': const Color(0xFFEC4899)};
    }

    switch (category) {
      case 'Ăn uống': return {'icon': Icons.restaurant_outlined, 'color': const Color(0xFFF59E0B)};
      case 'Di chuyển': return {'icon': Icons.directions_bus_outlined, 'color': const Color(0xFF3B82F6)};
      case 'Mua sắm': return {'icon': Icons.shopping_cart_outlined, 'color': const Color(0xFFEC4899)};
      case 'Hóa đơn': return {'icon': Icons.receipt_long_outlined, 'color': const Color(0xFF8B5CF6)};
      default: return {'icon': Icons.category_outlined, 'color': const Color(0xFF94A3B8)};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text("TÀI CHÍNH", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, letterSpacing: 2, color: Colors.black45)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black45,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.black.withOpacity(0.03), height: 1),
        ),
      ),
      body: Consumer<ChiTieuProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFF0F172A), strokeWidth: 1.5));
          }

          final filteredList = _selectedFilter == "Tất cả"
              ? provider.chiTieus
              : provider.chiTieus.where((ct) => ct.category == _selectedFilter).toList();

          return Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0F172A).withOpacity(0.15),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "TỔNG CHI TIÊU TRONG THÁNG",
                      style: TextStyle(color: Colors.white60, fontSize: 10, fontWeight: FontWeight.w500, letterSpacing: 1),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _formatCurrency(provider.totalExpense),
                      style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w300, color: Colors.white, letterSpacing: -0.5),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 44,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    _buildFilterChip("Tất cả"),
                    _buildFilterChip("Ăn uống"),
                    _buildFilterChip("Di chuyển"),
                    _buildFilterChip("Mua sắm"),
                    _buildFilterChip("Hóa đơn"),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              Expanded(
                child: filteredList.isEmpty
                    ? Center(
                        child: Text(
                          "Chưa có dữ liệu",
                          style: TextStyle(color: Colors.black.withOpacity(0.1), fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredList.length,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                        itemBuilder: (context, index) {
                          final ct = filteredList[index];
                          final iconData = _getGracefulIconData(ct.noiDung, ct.category);
                          final Color color = iconData['color'] as Color;

                          return Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.02),
                                  blurRadius: 20,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(16),
                              leading: Container(
                                width: 52,
                                height: 52,
                                decoration: BoxDecoration(
                                  color: color.withOpacity(0.08),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(iconData['icon'], color: color, size: 24),
                              ),
                              title: Text(
                                ct.noiDung,
                                style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xFF1E293B)),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  "${ct.category} • ${ct.ghiChu}",
                                  style: const TextStyle(color: Colors.black26, fontSize: 12, fontWeight: FontWeight.w400),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    _formatCurrency(ct.soTien),
                                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Color(0xFF1E293B)),
                                  ),
                                  const SizedBox(height: 4),
                                  GestureDetector(
                                    onTap: () => provider.deleteChiTieu(ct.id!),
                                    child: Icon(Icons.close_rounded, size: 16, color: Colors.black.withOpacity(0.1)),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddChiTieuScreen()),
          ).then((_) => Provider.of<ChiTieuProvider>(context, listen: false).loadChiTieus());
        },
        backgroundColor: const Color(0xFF0F172A),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 32),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    bool isSelected = _selectedFilter == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedFilter = label),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0F172A) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: isSelected ? null : Border.all(color: Colors.black.withOpacity(0.05)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black45,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
