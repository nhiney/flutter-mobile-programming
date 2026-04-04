import 'package:intl/intl.dart';

class SanPham {
  final int? id;
  final String ma;
  final String ten;
  final double gia;
  final double giamGia;
  final String imageUrl;

  SanPham({
    this.id,
    required this.ma,
    required this.ten,
    required this.gia,
    required this.giamGia,
    this.imageUrl = 'assets/images/placeholder.png',
  });

  // Business Logic: 10% Import Tax (Exercise 3 Requirement)
  double tinhThueNhapKhau() {
    return gia * 0.1;
  }

  // UI Calculated Properties
  double get totalTax => tinhThueNhapKhau();
  double get finalPrice => gia - giamGia + totalTax;

  // Formatting helpers for Premium UI
  String get formattedGia => NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(gia);
  String get formattedGiamGia => NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(giamGia);
  String get formattedTax => NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0).format(totalTax);
  String get formattedTotal => NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(finalPrice);

  // Exercise 3 Requirement: Console/Screen information output
  String xuatThongTin() {
    return "MÃ: $ma | TÊN: $ten | GIÁ: $formattedGia | GIẢM: $formattedGiamGia | THUẾ: $formattedTax";
  }

  SanPham copyWith({
    int? id,
    String? ma,
    String? ten,
    double? gia,
    double? giamGia,
    String? imageUrl,
  }) {
    return SanPham(
      id: id ?? this.id,
      ma: ma ?? this.ma,
      ten: ten ?? this.ten,
      gia: gia ?? this.gia,
      giamGia: giamGia ?? this.giamGia,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ma': ma,
      'ten': ten,
      'gia': gia,
      'giamGia': giamGia,
      'imageUrl': imageUrl,
    };
  }

  factory SanPham.fromMap(Map<String, dynamic> map) {
    return SanPham(
      id: map['id'] as int?,
      ma: map['ma'] as String? ?? 'N/A',
      ten: map['ten'] as String? ?? 'Unnamed Product',
      gia: (map['gia'] as num?)?.toDouble() ?? 0.0,
      giamGia: (map['giamGia'] as num?)?.toDouble() ?? 0.0,
      imageUrl: map['imageUrl'] as String? ?? 'assets/images/placeholder.png',
    );
  }
}
