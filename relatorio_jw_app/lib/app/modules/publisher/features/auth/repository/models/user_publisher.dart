
import 'dart:convert';

class UserPublisher {
  String? name;
  String? email;
  String? password;
  double? code;
  String? personId;

  UserPublisher({
    this.name,
    this.email,
    this.password,
    this.code,
    this.personId,
  });

  UserPublisher.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    email = map['email'];
    password = map['password'];
    code = map['code'];
    personId = map['personId'];
  }
  UserPublisher.fromJson(String dataJson) {
    Map<String, dynamic> map = jsonDecode(dataJson);
    UserPublisher.fromMap(map);
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['code'] = code;
    map['personId'] = personId;
    return map;
  }

  String toJson() {
    String dataJson = jsonEncode(toMap());
    return dataJson;
  }
}
