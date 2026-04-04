class ChiTieu {
  int? id;
  String noiDung;
  double soTien;
  String ghiChu;
  String category;

  ChiTieu({
    this.id,
    required this.noiDung,
    required this.soTien,
    required this.ghiChu,
    this.category = "Khác",
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'noiDung': noiDung,
      'soTien': soTien,
      'ghiChu': ghiChu,
      'category': category,
    };
  }

  factory ChiTieu.fromMap(Map<String, dynamic> map) {
    return ChiTieu(
      id: map['id'],
      noiDung: map['noiDung'],
      soTien: (map['soTien'] as num).toDouble(),
      ghiChu: map['ghiChu'],
      category: map['category'] ?? "Khác",
    );
  }
}
