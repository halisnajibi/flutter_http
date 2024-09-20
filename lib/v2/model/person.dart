class PersonModel {
  String nama;
  String email;
  String quote;
  String avatar;
  PersonModel({
    required this.nama,
    required this.email,
    required this.quote,
    required this.avatar,
  });

  factory PersonModel.formJson(Map<String, dynamic> json) {
    return PersonModel(
        nama: json['nama'],
        email: json['email'],
        quote: json['quote'],
        avatar: json['avatar']);
  }
}
