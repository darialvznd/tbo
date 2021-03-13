class Category {
  final int id;
  final int parentId;
  final String name;

  Category(this.id, this.parentId, this.name);

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(json['id'], json['parentId'], json['name']);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'parentId': parentId, 'name': name};
}
