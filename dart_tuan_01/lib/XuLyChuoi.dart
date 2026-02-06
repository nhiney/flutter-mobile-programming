import 'dart:io';

// Hàm chạy toàn bộ bài xử lý chuỗi
void runStringProgram() {
  // a. Nhập chuỗi
  stdout.write("Nhập vào một chuỗi: ");
  String input = stdin.readLineSync()!;

  // Xuất chuỗi
  print("\na. Chuỗi vừa nhập:");
  print(input);

  // b. Đếm số ký tự nguyên âm
  String vowels =
      "aeiouAEIOUáàạảãâấầậẩẫăắằặẳẵ"
      "éèẹẻẽêếềệểễ"
      "íìịỉĩ"
      "óòọỏõôốồộổỗơớờợởỡ"
      "úùụủũưứừựửữ"
      "ýỳỵỷỹ";

  int countVowel = 0;
  for (int i = 0; i < input.length; i++) {
    if (vowels.contains(input[i])) {
      countVowel++;
    }
  }

  print("b. Số ký tự là nguyên âm: $countVowel");

  // c. Đếm số từ
  List<String> words = input.trim().split(RegExp(r'\s+'));
  print("c. Số từ trong chuỗi: ${words.length}");

  // d. Kiểm tra chuỗi đối xứng
  String cleaned = input.replaceAll(" ", "").toLowerCase();
  String reversed = cleaned.split('').reversed.join();

  if (cleaned == reversed) {
    print("d. Chuỗi là chuỗi đối xứng");
  } else {
    print("d. Chuỗi không phải là chuỗi đối xứng");
  }

  // e. Đảo ngược thứ tự các từ
  List<String> reversedWords = words.reversed.toList();
  String result = reversedWords.join(" ");

  print("e. Chuỗi sau khi đảo ngược từ:");
  print(result);
}
