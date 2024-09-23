// ignore_for_file: public_member_api_docs, sort_constructors_first

class Sample3 {
  int code;
  Data data;
  Sample3({
    required this.code,
    required this.data,
  });

  factory Sample3.fromJson(Map<String, dynamic> json) {
    return Sample3(code: json['code'], data: Data.fromJson(json['data']));
  }

  @override
  String toString() => 'Sample3(code: $code, data: $data)';
}

class Data {
  int nomor;
  String arti;
  List<Ayat> ayat;
  Data({
    required this.nomor,
    required this.arti,
    required this.ayat,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      nomor: json['nomor'],
      arti: json['arti'],
      ayat: List<Ayat>.from(json['ayat'].map((a) => Ayat.fromJson(a))),
    );
  }
  @override
  String toString() => 'Data(nomor: $nomor, arti: $arti, ayat: $ayat)';
}

class Ayat {
  int nomorAyat;
  String teksLatin;
  Ayat({
    required this.nomorAyat,
    required this.teksLatin,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(nomorAyat: json['nomorAyat'], teksLatin: json['teksLatin']);
  }

  @override
  String toString() => 'Ayat(nomorAyat: $nomorAyat, teksLatin: $teksLatin)';
}
