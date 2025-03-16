class User {
  final String userId;
  final String firstName;
  final String? lastName;
  final DateTime? birthDate;
  final String? gender;
  final String email;
  final String? phoneNumber;
  final String? avatarUrl;
  final int role;
  final int status;

  User({
    required this.userId,
    required this.firstName,
    this.lastName,
    this.birthDate,
    this.gender,
    required this.email,
    this.phoneNumber,
    this.avatarUrl,
    required this.role,
    required this.status,
  });

  // Convert từ JSON sang object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json["user_id"] ?? "",
      firstName: json["first_name"] ?? "",
      lastName: json["last_name"],
      birthDate:
          json["birth_date"] != null
              ? DateTime.tryParse(json["birth_date"])
              : null,
      gender: json["gender"],
      email: json["email"] ?? "",
      phoneNumber: json["phone_number"],
      avatarUrl: json["avatar_url"],
      role: json["role"] ?? 0,
      status: json["status"] ?? 0,
    );
  }

  // Convert object sang JSON
  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "first_name": firstName,
      "last_name": lastName,
      "birth_date": birthDate?.toIso8601String(),
      "gender": gender,
      "email": email,
      "phone_number": phoneNumber,
      "avatar_url": avatarUrl,
      "role": role,
      "status": status,
    };
  }
}
