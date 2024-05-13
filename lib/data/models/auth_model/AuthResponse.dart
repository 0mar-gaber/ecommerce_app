import 'User.dart';

/// message : "success"
/// statusMsg : "fail"
/// user : {"name":"omar","email":"omar2@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NDA2YTc0ZDlkNzY2MDI3NWI0ZmY0MSIsIm5hbWUiOiJvbWFyIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MTU0OTc1ODksImV4cCI6MTcyMzI3MzU4OX0.8RuFxR9QUbuFi1mnDgri5VvFTLpvkpGXhizZmHnUU4E"

class AuthResponse {
  AuthResponse({
      this.message, 
      this.statusMsg, 
      this.user, 
      this.token,});

  AuthResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  String? statusMsg;
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}