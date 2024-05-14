import 'User.dart';
import 'Errors.dart';

/// message : "success"
/// user : {"name":"cahvahs","email":"asdna@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NDJiYjRhZDlkNzY2MDI3NWJjODBlOCIsIm5hbWUiOiJjYWh2YWhzIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MTU2NDkzNTUsImV4cCI6MTcyMzQyNTM1NX0.VEmHKXJAkweRmjgkOZoFvMn4iUsw0_ii9ob8vCF5OO0"
/// errors : {"value":"ca","msg":"must be at least 3 chars","param":"name","location":"body"}

class AuthResponse {
  AuthResponse({
      this.message, 
      this.user, 
      this.token, 
      this.errors,});

  AuthResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }
  String? message;
  User? user;
  String? token;
  Errors? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    return map;
  }

}