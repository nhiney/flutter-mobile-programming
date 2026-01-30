import 'dart:io';
import 'dart:math';

void main() {
  Random random = Random();

  // Nhập số lượng phần tử
  stdout.write("Nhập số lượng phần tử của danh sách: ");
  int n = int.parse(stdin.readLineSync()!);

  List<int> list = [];

  // Tạo danh sách số ngẫu nhiên từ 5 đến 100
  for (int i = 0; i < n; i++) {
    list.add(5 + random.nextInt(96));
  }

  // a. Xuất danh sách
  print("\na. Danh sách vừa tạo:");
  print(list);

  // b. Trung bình cộng các số lẻ
  int tongLe = 0;
  int demLe = 0;

  for (int x in list) {
    if (x % 2 != 0) {
      tongLe += x;
      demLe++;
    }
  }

  if (demLe == 0) {
    print("b. Danh sách không có số lẻ");
  } else {
    print("b. Trung bình cộng các số lẻ: ${tongLe / demLe}");
  }

  // c. Kiểm tra danh sách đối xứng
  bool doiXung = true;
  for (int i = 0; i < list.length ~/ 2; i++) {
    if (list[i] != list[list.length - 1 - i]) {
      doiXung = false;
      break;
    }
  }

  if (doiXung) {
    print("c. Danh sách là danh sách đối xứng");
  } else {
    print("c. Danh sách không phải là danh sách đối xứng");
  }

  // d. Kiểm tra danh sách tăng dần
  bool tangDan = true;
  for (int i = 0; i < list.length - 1; i++) {
    if (list[i] > list[i + 1]) {
      tangDan = false;
      break;
    }
  }

  if (tangDan) {
    print("d. Danh sách được sắp xếp tăng dần");
  } else {
    print("d. Danh sách không được sắp xếp tăng dần");
  }

  // e. Phần tử lớn nhất
  int maxValue = list[0];
  for (int x in list) {
    if (x > maxValue) {
      maxValue = x;
    }
  }
  print("e. Phần tử lớn nhất trong danh sách: $maxValue");

  // f. Số chẵn lớn nhất
  int? maxChan;
  for (int x in list) {
    if (x % 2 == 0) {
      if (maxChan == null || x > maxChan!) {
        maxChan = x;
      }
    }
  }

  if (maxChan == null) {
    print("f. Danh sách không có số chẵn");
  } else {
    print("f. Số chẵn lớn nhất: $maxChan");
  }

  // g. Tìm và xóa giá trị nhập vào
  stdout.write("g. Nhập giá trị cần tìm: ");
  int value = int.parse(stdin.readLineSync()!);

  if (!list.contains(value)) {
    print("Không tìm thấy");
  } else {
    list.removeWhere((element) => element == value);
    print("Danh sách sau khi xóa các phần tử bằng $value:");
    print(list);
  }
}
