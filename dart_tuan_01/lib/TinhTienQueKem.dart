import 'dart:io';

// Hàm chạy chương trình
void runIceCreamProgram() {
  // Nhập số que kem
  stdout.write("Nhập số que kem cần mua (>0): ");
  int soQue = int.parse(stdin.readLineSync()!);

  // Nhập giá tiền một que kem
  stdout.write("Nhập giá tiền của một que kem: ");
  double giaQue = double.parse(stdin.readLineSync()!);

  // Tính tổng tiền ban đầu
  double tongTien = soQue * giaQue;
  double tienPhaiTra = tongTien;

  // Xét điều kiện giảm giá
  if (soQue > 10) {
    tienPhaiTra = tongTien * 0.9; // giảm 10%
  } else if (soQue >= 5 && soQue <= 10) {
    tienPhaiTra = tongTien * 0.95; // giảm 5%
  }

  // Xuất kết quả
  print("Tổng tiền ban đầu: $tongTien");
  print("Số tiền phải trả sau giảm giá: $tienPhaiTra");
}


