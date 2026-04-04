import 'package:flutter/material.dart';
import 'package:flutter_tuan_6/database/db_helper.dart';
import 'package:flutter_tuan_6/models/sinh_vien/sinhvien.dart';

class SinhVienProvider extends ChangeNotifier {
  List<SinhVien> _sinhViens = [];
  List<SinhVien> _filteredSinhViens = [];
  String _searchQuery = "";

  List<SinhVien> get sinhViens => _searchQuery.isEmpty ? _sinhViens : _filteredSinhViens;

  Future<void> loadSinhViens() async {
    _sinhViens = await DatabaseHelper().getSinhViens();
    _filterSinhViens();
    notifyListeners();
  }

  Future<void> addSinhVien(SinhVien sv) async {
    await DatabaseHelper().insertSinhVien(sv);
    await loadSinhViens();
  }

  Future<void> deleteSinhVien(int id) async {
    await DatabaseHelper().deleteSinhVien(id);
    await loadSinhViens();
  }

  Future<void> updateSinhVien(SinhVien sv) async {
    await DatabaseHelper().updateSinhVien(sv);
    await loadSinhViens();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    _filterSinhViens();
    notifyListeners();
  }

  void _filterSinhViens() {
    if (_searchQuery.isEmpty) {
      _filteredSinhViens = _sinhViens;
    } else {
      _filteredSinhViens = _sinhViens
          .where((sv) =>
              sv.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              sv.email.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }
}
