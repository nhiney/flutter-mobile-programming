import 'package:flutter/material.dart';
import '../../models/san_pham/sanpham.dart';

class SanPhamProvider extends ChangeNotifier {
  // Main Data Store (In-Memory for this Senior Refactor)
  final List<SanPham> _sanPhams = [
    SanPham(
      id: 1,
      ma: 'IP15',
      ten: 'iPhone 15 Pro Max',
      gia: 34990000.0,
      giamGia: 1000000.0,
      imageUrl: 'assets/images/ip15.png',
    ),
    SanPham(
      id: 2,
      ma: 'S24U',
      ten: 'Samsung Galaxy S24 Ultra',
      gia: 29990000.0,
      giamGia: 1500000.0,
      imageUrl: 'assets/images/samsung.png',
    ),
    SanPham(
      id: 3,
      ma: 'MBP14',
      ten: 'MacBook Pro 14 M3',
      gia: 39990000.0,
      giamGia: 500000.0,
      imageUrl: 'assets/images/mac.png',
    ),
    SanPham(
      id: 4,
      ma: 'AWU2',
      ten: 'Apple Watch Ultra 2',
      gia: 21990000.0,
      giamGia: 800000.0,
      imageUrl: 'assets/images/watch.png',
    ),
  ];

  bool _isLoading = false;
  String _searchQuery = '';

  // Getters
  List<SanPham> get sanPhams => List.unmodifiable(_sanPhams);
  bool get isLoading => _isLoading;
  String get searchQuery => _searchQuery;

  // High-performance search filtering
  List<SanPham> get filteredSanPhams {
    if (_searchQuery.isEmpty) return _sanPhams;
    final lowercaseQuery = _searchQuery.toLowerCase();
    return _sanPhams.where((sp) => 
      sp.ten.toLowerCase().contains(lowercaseQuery) || 
      sp.ma.toLowerCase().contains(lowercaseQuery)
    ).toList();
  }

  // Update logic
  void setSearchQuery(String query) {
    if (_searchQuery == query) return;
    _searchQuery = query;
    notifyListeners();
  }

  // CRUD Operations
  Future<void> addSanPham(SanPham sp) async {
    _sanPhams.insert(0, sp.copyWith(id: DateTime.now().millisecondsSinceEpoch));
    notifyListeners();
  }

  Future<void> updateSanPham(SanPham sp) async {
    final index = _sanPhams.indexWhere((item) => item.id == sp.id);
    if (index != -1) {
      _sanPhams[index] = sp;
      notifyListeners();
    }
  }

  Future<void> deleteSanPham(int id) async {
    _sanPhams.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
