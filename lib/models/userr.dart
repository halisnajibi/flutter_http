class UserModel {
  late String firstName;
  late String email;
  late String avatar;
  UserModel(
      {required this.firstName, required this.email, required this.avatar});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'first_name': String first_name,
        'email': String email,
        'avatar': String avatar,
      } =>
        UserModel(
          firstName: first_name,
          email: email,
          avatar: avatar,
        ),
      _ => throw const FormatException('Failed to load user.'),
    };
  }
}
