// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Mounth {
  String? id;
  String? nome;
  String? sigla;
  Mounth({
    required this.id,
    required this.nome,
    required this.sigla,
  });

  Mounth.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    sigla = map['sigla'];
  }
  Mounth.fromJson(String json) {
    Map<String, dynamic> map = {};
    map = jsonDecode(json);
    Mounth.fromMap(map);
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['id'] = id;
    map['nome'] = nome;
    map['sigla'] = sigla;
    return map;
  }

  String toJson() {
    String json;
    json = jsonEncode(toMap());
    return json;
  }

  
}
