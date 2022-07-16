class User {
  final int? id;
  final String title;
  final double value;


  User(
      { this.id,
      required this.title,
      required this.value,
      });

  User.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"],
        value = res["value"];

  Map<String, Object?> toMap() {
    return {'id':id,'title': title, 'value': value};
  }
}
