import 'phong.dart';

class PhongB extends Phong {
  int giatUi;
  int soMay;

  PhongB(
    String maPhong,
    int soNguoi,
    int soDien,
    int soNuoc,
    this.giatUi,
    this.soMay,
  ) : super(maPhong, soNguoi, soDien, soNuoc);

  @override
  double tinhTien() {
    return 2000 + 2 * soDien + 8 * soNuoc + giatUi * 5 + soMay * 100;
  }

  @override
  String toString() {
    return 'PhongB - ${super.toString()}, Giặt ủi: $giatUi, Số máy: $soMay, Tiền phòng: ${tinhTien()}';
  }
}
