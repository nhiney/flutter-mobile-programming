import '../khach_hang.dart';
import '../khach_hang_cong_ty.dart';

class QuanLyHoaDon {
  List<KhachHang> ds = [];

  void themHoaDon(KhachHang kh) {
    ds.add(kh);
  }

  void xuatDanhSach() {
    for (var kh in ds) {
      kh.xuatThongTin();
    }
  }

  double tongThanhTien() {
    return ds.fold(0, (sum, e) => sum + e.thanhTien());
  }

  double tongTroGia() {
    return ds.fold(0, (sum, e) => sum + e.tinhTroGia());
  }

  KhachHang? muaNhieuNhat() {
    if (ds.isEmpty) return null;
    ds.sort((a, b) => b.soLuong.compareTo(a.soLuong));
    return ds.first;
  }

  double tongChietKhauCongTy() {
    return ds
        .where((e) => e is KhachHangCongTy)
        .fold(0, (sum, e) => sum + e.tinhChietKhau());
  }

  void sapXep() {
    ds.sort((a, b) {
      if (a.soLuong != b.soLuong) {
        return a.soLuong.compareTo(b.soLuong);
      }
      return b.thanhTien().compareTo(a.thanhTien());
    });
  }

  void timTheoMa(String ma) {
    var found = ds.where((e) => e.maKH == ma);
    if (found.isEmpty) {
      print('Khách hàng lạ');
    } else {
      found.forEach((e) => e.xuatThongTin());
    }
  }
}
