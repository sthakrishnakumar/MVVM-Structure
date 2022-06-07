class UserModel {
  final int id;
  final String email;
  final String firstNAme;
  final String lastName;
  final String avatar;
  UserModel({
    required this.id,
    required this.email,
    required this.firstNAme,
    required this.lastName,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      email: map['email'] as String,
      firstNAme: map['first_name'] as String,
      lastName: map['last_name'] as String,
      avatar: map['avatar'] as String,
    );
  }
}

class UserDetailModel {
  final int id;
  final String email;
  final String firstNAme;
  final String lastName;
  final String avatar;
  UserDetailModel({
    required this.id,
    required this.email,
    required this.firstNAme,
    required this.lastName,
    required this.avatar,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> map) {
    return UserDetailModel(
      id: map['id'] as int,
      email: map['email'] as String,
      firstNAme: map['first_name'] as String,
      lastName: map['last_name'] as String,
      avatar: map['avatar'] as String,
    );
  }
}
