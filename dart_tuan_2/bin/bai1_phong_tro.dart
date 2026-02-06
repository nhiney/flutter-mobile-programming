import 'dart:io';
import 'package:dart_tuan_2/phong.dart';
import 'package:dart_tuan_2/phong_a.dart';
import 'package:dart_tuan_2/phong_b.dart';

void main() {
  final file = File('phongthue.txt');
  if (!file.existsSync()) {
    print('Không tìm thấy file phongthue.txt');
    return;
  }

  List<Phong> danhSachPhong = [];

  for (var line in file.readAsLinesSync()) {
    if (line.trim().isEmpty) continue;

    var parts = line.split('#');
    String maPhong = parts[0];

    if (maPhong.startsWith('A')) {
      danhSachPhong.add(
        PhongA(
          maPhong,
          int.parse(parts[1]),
          int.parse(parts[2]),
          int.parse(parts[3]),
          int.parse(parts[4]),
        ),
      );
    } else if (maPhong.startsWith('B')) {
      danhSachPhong.add(
        PhongB(
          maPhong,
          int.parse(parts[1]),
          int.parse(parts[2]),
          int.parse(parts[3]),
          int.parse(parts[4]),
          int.parse(parts[5]),
        ),
      );
    }
  }

  // 1. In danh sách phòng
  print('--- Danh sách phòng ---');
  danhSachPhong.forEach(print);

  // 2. Phòng có số người > 2
  print('\n--- Phòng có số người > 2 ---');
  danhSachPhong.where((p) => p.soNguoi > 2).forEach(print);

  // 3. Tổng tiền phòng
  double tongTien =
      danhSachPhong.fold(0, (sum, p) => sum + p.tinhTien());
  print('\nTổng tiền phòng thu được: $tongTien');

  // 4. Sắp xếp theo số điện giảm dần
  danhSachPhong.sort((a, b) => b.soDien.compareTo(a.soDien));
  print('\n--- Danh sách phòng sau khi sắp xếp theo số điện giảm dần ---');
  danhSachPhong.forEach(print);

  // 5. Danh sách phòng loại A
  print('\n--- Danh sách phòng loại A ---');
  danhSachPhong.whereType<PhongA>().forEach(print);
}
