import 'package:dart_tuan_2/khach_hang_ca_nhan.dart';
import 'package:dart_tuan_2/dai_ly_cap_1.dart';
import 'package:dart_tuan_2/khach_hang_cong_ty.dart';
import 'package:dart_tuan_2/quan_ly_hoa_don.dart';

void main() {
  QuanLyHoaDon ql = QuanLyHoaDon();

  ql.themHoaDon(KhachHangCaNhan('KH0001', 'Nguyen Van A', 3, 8000000, 8));
  ql.themHoaDon(DaiLyCap1('KH0002', 'Dai Ly ABC', 10, 7500000, 6));
  ql.themHoaDon(KhachHangCongTy('KH0003', 'Cong Ty XYZ', 5, 7800000, 6000));

  print('=== DANH SÁCH HÓA ĐƠN ===');
  ql.xuatDanhSach();

  print('\nTổng thành tiền: ${ql.tongThanhTien()}');
  print('Tổng trợ giá: ${ql.tongTroGia()}');

  var max = ql.muaNhieuNhat();
  if (max != null) {
    print('\nKhách hàng mua nhiều nhất:');
    max.xuatThongTin();
  }

  print('\nTổng chiết khấu KH công ty: ${ql.tongChietKhauCongTy()}');

  print('\nSau khi sắp xếp:');
  ql.sapXep();
  ql.xuatDanhSach();

  print('\nTìm KH0001:');
  ql.timTheoMa('KH0001');
}
