import 'khach_hang.dart';

class KhachHangCaNhan extends KhachHang {
  double khoangCach;

  KhachHangCaNhan(
      String maKH,
      String tenKH,
      int soLuong,
      double giaBan,
      this.khoangCach)
      : super(maKH, tenKH, soLuong, giaBan);

  @override
  double tinhChietKhau() {
    double ck = 0;
    if (soLuong >= 3) {
      ck += soLuong * giaBan * 0.05;
    }
    if (khoangCach < 10) {
      ck += soLuong * 50000;
    }
    return ck;
  }

  @override
  double tinhTroGia() {
    double tg = soLuong * giaBan * 0.02;
    if (soLuong > 2) tg += 100000;
    return tg;
  }

  @override
  void xuatThongTin() {
    print(
        'CN | $maKH | $tenKH | SL: $soLuong | Giá: $giaBan | Thành tiền: ${thanhTien()} | Trợ giá: ${tinhTroGia()}');
  }
}
