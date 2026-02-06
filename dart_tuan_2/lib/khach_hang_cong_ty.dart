import 'khach_hang.dart';

class KhachHangCongTy extends KhachHang {
  int soNhanVien;

  KhachHangCongTy(
      String maKH,
      String tenKH,
      int soLuong,
      double giaBan,
      this.soNhanVien)
      : super(maKH, tenKH, soLuong, giaBan);

  @override
  double tinhChietKhau() {
    if (soNhanVien > 5000) return soLuong * giaBan * 0.07;
    if (soNhanVien > 1000) return soLuong * giaBan * 0.05;
    return 0;
  }

  @override
  double tinhTroGia() {
    return soLuong * 120000;
  }

  @override
  void xuatThongTin() {
    print(
        'CT | $maKH | $tenKH | SL: $soLuong | Giá: $giaBan | Thành tiền: ${thanhTien()} | Trợ giá: ${tinhTroGia()}');
  }
}
