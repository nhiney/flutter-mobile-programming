import 'mon_hoc.dart';

class MonDoAn extends MonHoc {
  double diemGVHD;
  double diemGVPB;

  MonDoAn(
    String ma,
    String ten,
    int tc,
    this.diemGVHD,
    this.diemGVPB,
  ) : super(ma, ten, tc);

  @override
  double tinhDTB() {
    return (diemGVHD + diemGVPB) / 2;
  }
}
