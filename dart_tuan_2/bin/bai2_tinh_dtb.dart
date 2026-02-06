import 'dart:io';
import 'package:dart_tuan_2/mon_hoc.dart';
import 'package:dart_tuan_2/mon_ly_thuyet.dart';
import 'package:dart_tuan_2/mon_thuc_hanh.dart';
import 'package:dart_tuan_2/mon_do_an.dart';

void main() {
  List<MonHoc> dsMon = [];

  // 1. Nhập ds môn học
  stdout.write('Nhập số môn học cần nhập tay: ');
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n; i++) {
    print('\nNhập môn thứ ${i + 1}:');

    stdout.write('Loại môn (LT / TH / DA): ');
    String loai = stdin.readLineSync()!.toUpperCase();

    stdout.write('Mã môn: ');
    String ma = stdin.readLineSync()!;

    stdout.write('Tên môn: ');
    String ten = stdin.readLineSync()!;

    stdout.write('Số tín chỉ: ');
    int tc = int.parse(stdin.readLineSync()!);

    if (loai == 'LT') {
      stdout.write('Điểm tiểu luận: ');
      double tl = double.parse(stdin.readLineSync()!);
      stdout.write('Điểm cuối kỳ: ');
      double ck = double.parse(stdin.readLineSync()!);
      dsMon.add(MonLyThuyet(ma, ten, tc, tl, ck));
    } else if (loai == 'TH') {
      stdout.write('Điểm KT1: ');
      double d1 = double.parse(stdin.readLineSync()!);
      stdout.write('Điểm KT2: ');
      double d2 = double.parse(stdin.readLineSync()!);
      stdout.write('Điểm KT3: ');
      double d3 = double.parse(stdin.readLineSync()!);
      dsMon.add(MonThucHanh(ma, ten, tc, d1, d2, d3));
    } else if (loai == 'DA') {
      stdout.write('Điểm GVHD: ');
      double gvhd = double.parse(stdin.readLineSync()!);
      stdout.write('Điểm GVPB: ');
      double gvpb = double.parse(stdin.readLineSync()!);
      dsMon.add(MonDoAn(ma, ten, tc, gvhd, gvpb));
    }
  }

  //2. Đọc file
  final file = File('monhoc.txt');
  if (file.existsSync()) {
    for (var line in file.readAsLinesSync()) {
      if (line.trim().isEmpty) continue;
      var p = line.split('#');

      if (p[0].startsWith('LT')) {
        dsMon.add(
          MonLyThuyet(
            p[0],
            p[1],
            int.parse(p[2]),
            double.parse(p[3]),
            double.parse(p[4]),
          ),
        );
      } else if (p[0].startsWith('TH')) {
        dsMon.add(
          MonThucHanh(
            p[0],
            p[1],
            int.parse(p[2]),
            double.parse(p[3]),
            double.parse(p[4]),
            double.parse(p[5]),
          ),
        );
      } else if (p[0].startsWith('DA')) {
        dsMon.add(
          MonDoAn(
            p[0],
            p[1],
            int.parse(p[2]),
            double.parse(p[3]),
            double.parse(p[4]),
          ),
        );
      }
    }
  }

  print('\n--- DANH SÁCH MÔN HỌC ---');
  dsMon.forEach(print);

  // Kiem tra tang dan theo tem
  bool tangDanTen = true;
  for (int i = 0; i < dsMon.length - 1; i++) {
    if (dsMon[i].tenMon.compareTo(dsMon[i + 1].tenMon) > 0) {
      tangDanTen = false;
      break;
    }
  }
  print('\nDanh sách tăng dần theo tên môn: $tangDanTen');

  // Sap xep theo so tin chi
  dsMon.sort((a, b) => a.soTinChi.compareTo(b.soTinChi));
  print('\n--- DANH SÁCH SAU KHI SẮP XẾP THEO SỐ TÍN CHỈ ---');
  dsMon.forEach(print);

  // Mon co so tin chi cao nhat
  int maxTC = dsMon.map((e) => e.soTinChi).reduce((a, b) => a > b ? a : b);
  print('\n--- MÔN CÓ SỐ TÍN CHỈ CAO NHẤT ($maxTC TC) ---');
  dsMon.where((e) => e.soTinChi == maxTC).forEach(print);

  // Tim mon theo ten
  stdout.write('\nNhập tên môn cần tìm: ');
  String tenTim = stdin.readLineSync()!;

  var found = dsMon.where((e) => e.tenMon == tenTim).toList();
  if (found.isEmpty) {
    print('Không tìm thấy môn "$tenTim". Thêm mới vào danh sách.');
    dsMon.add(MonLyThuyet('LT_NEW', tenTim, 3, 7.0, 8.0));
  } else {
    print('Tìm thấy môn:');
    found.forEach(print);
  }

  // Tinh so tin chi trung binh
  double tbTC =
      dsMon.map((e) => e.soTinChi).reduce((a, b) => a + b) / dsMon.length;
  print('\nSố tín chỉ trung bình: ${tbTC.toStringAsFixed(2)}');
}
