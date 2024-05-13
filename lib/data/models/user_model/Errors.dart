/// value : "66423e95d9d7660275b8e77fsas"
/// msg : "Invalid ID "
/// param : "id"
/// location : "params"

class Errors {
  Errors({
      this.value, 
      this.msg, 
      this.param, 
      this.location,});

  Errors.fromJson(dynamic json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }
  String? value;
  String? msg;
  String? param;
  String? location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['msg'] = msg;
    map['param'] = param;
    map['location'] = location;
    return map;
  }

}