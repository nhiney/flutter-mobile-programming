import 'dart:io';

// Hàm kiểm tra số nguyên tố
bool laSoNguyenTo(int n) {
  if (n < 2) return false;
  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

// Hàm chạy toàn bộ chương trình
void runPrimeListProgram() {
  // Nhập số lượng phần tử
  stdout.write("Nhập số lượng phần tử của danh sách: ");
  int n = int.parse(stdin.readLineSync()!);

  List<int> danhSach = [];

  // Nhập các phần tử
  for (int i = 0; i < n; i++) {
    stdout.write("Nhập phần tử thứ ${i + 1}: ");
    int x = int.parse(stdin.readLineSync()!);
    danhSach.add(x);
  }

  // a. Xuất danh sách
  print("\nDanh sách vừa nhập:");
  print(danhSach);

  // b. Tính tổng các phần tử
  int tong = 0;
  for (int x in danhSach) {
    tong += x;
  }
  print("Tổng các phần tử trong danh sách: $tong");

  // c. Xuất các số nguyên tố
  print("Các số nguyên tố trong danh sách:");
  bool coSoNguyenTo = false;
  for (int x in danhSach) {
    if (laSoNguyenTo(x)) {
      print(x);
      coSoNguyenTo = true;
    }
  }
  if (!coSoNguyenTo) {
    print("Danh sách không có số nguyên tố");
  }

  // d. Nhập giá trị cần tìm
  stdout.write("\nNhập giá trị cần tìm: ");
  int giaTriCanTim = int.parse(stdin.readLineSync()!);

  if (danhSach.contains(giaTriCanTim)) {
    int viTri = danhSach.indexOf(giaTriCanTim);
    print("Giá trị $giaTriCanTim có trong danh sách ở vị trí: $viTri");
  } else {
    danhSach.insert(0, giaTriCanTim);
    print("Giá trị không có trong danh sách.");
    print("Danh sách sau khi thêm vào đầu:");
    print(danhSach);
  }
}
