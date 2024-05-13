import 'Data.dart';
import 'Errors.dart';

/// data : {"role":"user","active":true,"wishlist":["6428ebc6dc1175abc65ca0b9"],"_id":"66423e95d9d7660275b8e77f","name":"omar","email":"bora@gmail.com","phone":"01222255255","password":"$2a$12$qJAxQWEeL/LgpUOVqcKiZOVP21fLgC1lcITxCQI5bJOgcjXL56.J6","addresses":[{"_id":"664288cbd9d7660275bbeb01","name":"Home","details":"Home details","phone":"01010700700","city":"Gizaa"}],"createdAt":"2024-05-13T16:23:49.771Z","updatedAt":"2024-05-13T21:41:11.772Z","__v":0}
/// message : "fail"
/// errors : {"value":"66423e95d9d7660275b8e77fsas","msg":"Invalid ID ","param":"id","location":"params"}

class UserResponse {
  UserResponse({
      this.data, 
      this.message, 
      this.errors,});

  UserResponse.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }
  Data? data;
  String? message;
  Errors? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    return map;
  }

}