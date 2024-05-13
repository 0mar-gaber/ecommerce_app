import 'Addresses.dart';

/// role : "user"
/// active : true
/// wishlist : ["6428ebc6dc1175abc65ca0b9"]
/// _id : "66423e95d9d7660275b8e77f"
/// name : "omar"
/// email : "bora@gmail.com"
/// phone : "01222255255"
/// password : "$2a$12$qJAxQWEeL/LgpUOVqcKiZOVP21fLgC1lcITxCQI5bJOgcjXL56.J6"
/// addresses : [{"_id":"664288cbd9d7660275bbeb01","name":"Home","details":"Home details","phone":"01010700700","city":"Gizaa"}]
/// createdAt : "2024-05-13T16:23:49.771Z"
/// updatedAt : "2024-05-13T21:41:11.772Z"
/// __v : 0

class Data {
  Data({
      this.role, 
      this.active, 
      this.wishlist, 
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.password, 
      this.addresses, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  Data.fromJson(dynamic json) {
    role = json['role'];
    active = json['active'];
    wishlist = json['wishlist'] != null ? json['wishlist'].cast<String>() : [];
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    if (json['addresses'] != null) {
      addresses = [];
      json['addresses'].forEach((v) {
        addresses?.add(Addresses.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? role;
  bool? active;
  List<String>? wishlist;
  String? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  List<Addresses>? addresses;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role'] = role;
    map['active'] = active;
    map['wishlist'] = wishlist;
    map['_id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    if (addresses != null) {
      map['addresses'] = addresses?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}