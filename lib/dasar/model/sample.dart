// ignore_for_file: public_member_api_docs, sort_constructors_first

class Sample {
  String name;
  int age;
  List<String>? hoby;
  Github github;
  List<Article>? articles;
  Sample(
      {required this.name,
      required this.age,
      this.hoby,
      required this.github,
      required this.articles});
  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
        name: json['name'],
        age: json['age'],
        hoby: List<String>.from(json['hoby']),
        github: Github.fromJson(json['github']),
        articles: List<Article>.from(
            json['articles'].map((article) => Article.fromJson(article))));
  }

  @override
  String toString() {
    return 'Sample(name: $name, age: $age, hoby: $hoby, github: $github, articles: $articles)';
  }
}

class Github {
  String username;
  int repositoris;
  Github({
    required this.username,
    required this.repositoris,
  });

  factory Github.fromJson(Map<String, dynamic> json) {
    return Github(username: json['username'], repositoris: json['repositoris']);
  }

  @override
  String toString() => 'Github(username: $username, repositoris: $repositoris)';
}

class Article {
  int id;
  String title;
  String body;
  Article({
    required this.id,
    required this.title,
    required this.body,
  });
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(id: json['id'], title: json['title'], body: json['body']);
  }

  @override
  String toString() => 'Article(id: $id, title: $title, body: $body)';
}
