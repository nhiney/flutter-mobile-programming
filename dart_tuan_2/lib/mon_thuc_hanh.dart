import 'mon_hoc.dart';

class MonThucHanh extends MonHoc {
  double diem1, diem2, diem3;

  MonThucHanh(
    String ma,
    String ten,
    int tc,
    this.diem1,
    this.diem2,
    this.diem3,
  ) : super(ma, ten, tc);

  @override
  double tinhDTB() {
    return (diem1 + diem2 + diem3) / 3;
  }
}
