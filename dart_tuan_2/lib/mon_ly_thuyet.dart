import 'mon_hoc.dart';

class MonLyThuyet extends MonHoc {
  double diemTieuLuan;
  double diemCuoiKy;

  MonLyThuyet(
    String ma,
    String ten,
    int tc,
    this.diemTieuLuan,
    this.diemCuoiKy,
  ) : super(ma, ten, tc);

  @override
  double tinhDTB() {
    return diemTieuLuan * 0.3 + diemCuoiKy * 0.7;
  }
}
