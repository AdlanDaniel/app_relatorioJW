// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:relatorio_jw_app/app/modules/publisher/resources/model/mounth.dart';

class ListMounth {
  List<Mounth>? listMonth;
  ListMounth({
    this.listMonth,
  });
  ListMounth.fromMap(Map<String, dynamic> map) {
    // listMonth = List<Mounth>.from((map['listMonth']))
    listMonth = (map['listMounth'] as List<dynamic>).map<Mounth>((value) {
      return Mounth.fromMap(value as Map<String, dynamic>);
    }).toList();
  }
  ListMounth.fromJson(String jsonData) {
    final mapMounth = jsonDecode(jsonData);
    ListMounth.fromMap(mapMounth);
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['listMounth'] = (listMonth as List).map<Mounth>((value) {
      return value.toMap();
    }).toList();
    return map;
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
  

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'listMonth': listMonth.map((x) => x.toMap()).toList(),
//     };
//   }

//   factory ListMounth.fromMap(Map<String, dynamic> map) {
//     return ListMounth(
//       listMonth: List<Mounth>.from((map['listMonth'] as List<int>).map<Mounth>((x) => Mounth.fromMap(x as Map<String,dynamic>),),),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ListMounth.fromJson(String source) => ListMounth.fromMap(json.decode(source) as Map<String, dynamic>);
// }
