abstract class Phong {
  String maPhong;
  int soNguoi;
  int soDien;
  int soNuoc;

  Phong(this.maPhong, this.soNguoi, this.soDien, this.soNuoc);

  double tinhTien();

  @override
  String toString() {
    return 'Mã: $maPhong, Số người: $soNguoi, Số điện: $soDien, Số nước: $soNuoc';
  }
}
