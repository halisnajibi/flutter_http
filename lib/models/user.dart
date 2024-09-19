class User {
  final String firstName;
  final String email;
  final String avatar;

  const User({
    required this.firstName,
    required this.email,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'first_name': String first_name,
        'email': String email,
        'avatar': String avatar,
      } =>
        User(
          firstName: first_name,
          email: email,
          avatar: avatar,
        ),
      _ => throw const FormatException('Failed to load user.'),
    };
  }
}
