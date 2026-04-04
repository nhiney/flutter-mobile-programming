import 'package:flutter/material.dart';
import '../../models/chi_tieu/chi_tieu.dart';
import '../../database/db_helper.dart';

class ChiTieuProvider with ChangeNotifier {
  List<ChiTieu> _chiTieus = [];
  bool _isLoading = false;

  List<ChiTieu> get chiTieus => _chiTieus;
  bool get isLoading => _isLoading;

  double get totalExpense => _chiTieus.fold(0, (sum, item) => sum + item.soTien);

  Future<void> loadChiTieus() async {
    _isLoading = true;
    notifyListeners();
    _chiTieus = await DatabaseHelper().getChiTieus();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addChiTieu(ChiTieu ct) async {
    await DatabaseHelper().insertChiTieu(ct);
    await loadChiTieus();
  }

  Future<void> updateChiTieu(ChiTieu ct) async {
    await DatabaseHelper().updateChiTieu(ct);
    await loadChiTieus();
  }

  Future<void> deleteChiTieu(int id) async {
    await DatabaseHelper().deleteChiTieu(id);
    await loadChiTieus();
  }
}
