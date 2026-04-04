class UserAccount {
  final int? id;
  final String email;
  final String password;

  UserAccount({
    this.id,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
    };
  }

  factory UserAccount.fromMap(Map<String, dynamic> map) {
    return UserAccount(
      id: map['id'],
      email: map['email'],
      password: map['password'],
    );
  }
}
