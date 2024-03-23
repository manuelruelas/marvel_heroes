class Character {
  int id;
  String name;
  String? description;
  String? thumbnailUrl;

  Character({
    required this.id,
    required this.name,
    this.description,
    this.thumbnailUrl,
  });
}
