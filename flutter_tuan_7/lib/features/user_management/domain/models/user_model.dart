class User {
  final int? id;
  final String name;
  final String email;
  final String password;
  final String dob;
  final String country;
  final String? avatarPath;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.dob,
    required this.country,
    this.avatarPath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'dob': dob,
      'country': country,
      'avatarPath': avatarPath,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      dob: map['dob'],
      country: map['country'],
      avatarPath: map['avatarPath'],
    );
  }

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? dob,
    String? country,
    String? avatarPath,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      dob: dob ?? this.dob,
      country: country ?? this.country,
      avatarPath: avatarPath ?? this.avatarPath,
    );
  }
}
