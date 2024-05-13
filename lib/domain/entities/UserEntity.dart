/// name : "omar"
/// email : "omar4@gmail.com"
/// role : "user"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NDA2YWVkZDlkNzY2MDI3NWI0ZmY1MCIsIm5hbWUiOiJvbWFyIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MTU0OTc3MTAsImV4cCI6MTcyMzI3MzcxMH0.GxMLuChQEtjY2IEH6X-SSl31QQXrIGRKfr6jSVcL8qM"

class UserEntity {
  UserEntity({
      this.name, 
      this.email, 
      this.role, 
      this.token,});

  UserEntity.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
    token = json['token'];
  }
  String? name;
  String? email;
  String? role;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    map['token'] = token;
    return map;
  }

}