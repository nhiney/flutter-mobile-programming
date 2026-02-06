import 'phong.dart';

class PhongA extends Phong {
  int soNguoiThan;

  PhongA(
    String maPhong,
    int soNguoi,
    int soDien,
    int soNuoc,
    this.soNguoiThan,
  ) : super(maPhong, soNguoi, soDien, soNuoc);

 @override
double tinhTien() {
  return (1400 + 2 * soDien + 8 * soNuoc + 50 * soNguoiThan).toDouble();
}

  @override
  String toString() {
    return 'PhongA - ${super.toString()}, Số người thân: $soNguoiThan, Tiền phòng: ${tinhTien()}';
  }
}
