abstract class KhachHang {
  String maKH;
  String tenKH;
  int soLuong;
  double giaBan;

  KhachHang(this.maKH, this.tenKH, this.soLuong, this.giaBan);

  double tinhChietKhau();
  double tinhTroGia();

  double tinhThueVAT() {
    return soLuong * giaBan * 0.1;
  }

  double thanhTien() {
    return soLuong * giaBan - tinhChietKhau() - tinhTroGia() + tinhThueVAT();
  }

  void xuatThongTin();
}
