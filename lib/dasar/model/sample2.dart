// ignore_for_file: public_member_api_docs, sort_constructors_first
class Sample2 {
  String tempatLahir;
  int tanggalLahir;
  List<Mahasiswa> mhs;
  Sample2(
      {required this.tempatLahir,
      required this.tanggalLahir,
      required this.mhs});

  factory Sample2.fromJson(Map<String, dynamic> json) {
    return Sample2(
      tempatLahir: json['tempatLahir'],
      tanggalLahir: json['tanggalLahir'],
      mhs: List<Mahasiswa>.from(
        json['mhs'].map((m) => Mahasiswa.fromJson(m)),
      ),
    );
  }

  @override
  String toString() =>
      'Sample2(tempatLahir: $tempatLahir, tanggalLahir: $tanggalLahir, mhs: $mhs)';
}

class Mahasiswa {
  String name;
  int npm;
  Mahasiswa({
    required this.name,
    required this.npm,
  });

  factory Mahasiswa.fromJson(Map<String, dynamic> json) {
    return Mahasiswa(name: json['name'], npm: json['npm']);
  }

  @override
  String toString() => 'Mahasiswa(name: $name, npm: $npm)';
}
