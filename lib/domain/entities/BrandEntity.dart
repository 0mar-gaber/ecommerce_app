/// _id : "64089f8b24b25627a25315ca"
/// name : "Lenovo"
/// slug : "lenovo"
/// image : "https://ecommerce.routemisr.com/Route-Academy-brands/1678286730980.png"

class BrandEntity {
  BrandEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});

  BrandEntity.fromJson(dynamic json) {
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