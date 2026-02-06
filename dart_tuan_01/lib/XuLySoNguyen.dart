import 'dart:io';

// Hàm chạy chương trình xử lý số
void runNumberProgram() {
  // Nhập số nguyên dương > 10
  stdout.write("Nhập một số nguyên dương (>10): ");
  int n = int.parse(stdin.readLineSync()!);

  // Chuyển số sang chuỗi để xử lý chữ số
  String chuoiSo = n.toString();

  // a. Số chữ số
  int soChuSo = chuoiSo.length;

  // b. Tổng các chữ số
  int tongChuSo = 0;

  // c. Kiểm tra chữ số lẻ
  bool coChuSoLe = false;

  for (int i = 0; i < chuoiSo.length; i++) {
    int chuSo = int.parse(chuoiSo[i]);
    tongChuSo += chuSo;

    if (chuSo % 2 != 0) {
      coChuSoLe = true;
    }
  }

  // Xuất kết quả
  print("Số chữ số của số đã nhập: $soChuSo");
  print("Tổng các chữ số: $tongChuSo");

  if (coChuSoLe) {
    print("Số đã nhập có chứa chữ số lẻ");
  } else {
    print("Số đã nhập không chứa chữ số lẻ");
  }
}
