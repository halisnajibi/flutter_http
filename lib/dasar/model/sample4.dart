// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final sample4 = sample4FromJson(jsonString);
class Sample4 {
  List<Datum> data;
  List<Included> included;

  Sample4({
    required this.data,
    required this.included,
  });

  factory Sample4.fromJson(Map<String, dynamic> json) => Sample4(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        included: List<Included>.from(
            json["included"].map((x) => Included.fromJson(x))),
      );

  @override
  String toString() => 'Sample4(data: $data, included: $included)';
}

class Datum {
  String type;
  String id;
  DatumAttributes attributes;
  Relationships relationships;

  Datum({
    required this.type,
    required this.id,
    required this.attributes,
    required this.relationships,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json["type"],
        id: json["id"],
        attributes: DatumAttributes.fromJson(json["attributes"]),
        relationships: Relationships.fromJson(json["relationships"]),
      );

  @override
  String toString() =>
      'Datum(type: $type, id: $id, relationships: $relationships)';
}

class DatumAttributes {
  String title;
  String body;
  DateTime created;
  DateTime updated;

  DatumAttributes({
    required this.title,
    required this.body,
    required this.created,
    required this.updated,
  });

  factory DatumAttributes.fromJson(Map<String, dynamic> json) =>
      DatumAttributes(
        title: json["title"],
        body: json["body"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
      );

  @override
  String toString() {
    return 'DatumAttributes(title: $title, body: $body, created: $created, updated: $updated)';
  }
}

class Relationships {
  Author author;

  Relationships({
    required this.author,
  });

  factory Relationships.fromJson(Map<String, dynamic> json) => Relationships(
        author: Author.fromJson(json["author"]),
      );

  @override
  String toString() => 'Relationships(author: $author)';
}

class Author {
  Data data;

  Author({
    required this.data,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        data: Data.fromJson(json["data"]),
      );

  @override
  String toString() => 'Author(data: $data)';
}

class Data {
  String id;
  String type;

  Data({
    required this.id,
    required this.type,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        type: json["type"],
      );

  @override
  String toString() => 'Data(id: $id, type: $type)';
}

class Included {
  String type;
  String id;
  IncludedAttributes attributes;

  Included({
    required this.type,
    required this.id,
    required this.attributes,
  });

  factory Included.fromJson(Map<String, dynamic> json) => Included(
        type: json["type"],
        id: json["id"],
        attributes: IncludedAttributes.fromJson(json["attributes"]),
      );

  @override
  String toString() => 'Included(type: $type, id: $id)';
}

class IncludedAttributes {
  String name;
  int age;
  String gender;

  IncludedAttributes({
    required this.name,
    required this.age,
    required this.gender,
  });

  factory IncludedAttributes.fromJson(Map<String, dynamic> json) =>
      IncludedAttributes(
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
      );

  @override
  String toString() =>
      'IncludedAttributes(name: $name, age: $age, gender: $gender)';
}
