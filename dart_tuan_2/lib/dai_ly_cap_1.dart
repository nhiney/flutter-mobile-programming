import 'khach_hang.dart';

class DaiLyCap1 extends KhachHang {
  int thoiGianHopTac;

  DaiLyCap1(
      String maKH,
      String tenKH,
      int soLuong,
      double giaBan,
      this.thoiGianHopTac)
      : super(maKH, tenKH, soLuong, giaBan);

  @override
  double tinhChietKhau() {
    double percent = 0.3;
    if (thoiGianHopTac > 5) {
      percent += (thoiGianHopTac - 5) * 0.01;
    }
    if (percent > 0.35) percent = 0.35;
    return soLuong * giaBan * percent;
  }

  @override
  double tinhTroGia() => 0;

  @override
  void xuatThongTin() {
    print(
        'DL1 | $maKH | $tenKH | SL: $soLuong | Giá: $giaBan | Thành tiền: ${thanhTien()}');
  }
}
