/// _id : "6439d3c867d9aa4ca97064ba"
/// name : "Books"
/// slug : "books"
/// image : "https://ecommerce.routemisr.com/Route-Academy-categories/1681511368164.png"

class CategoryEntity {
  CategoryEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});

  CategoryEntity.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
  String? id;
  String? name;
  String? slug;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

}