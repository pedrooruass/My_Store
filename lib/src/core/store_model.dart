import 'package:store/src/core/aisle_model.dart';

class StoreModel {
  String name;
  List<AisleModel> aisle = [];
  String slogan;
  StoreModel({
    this.name,
    this.aisle,
    this.slogan,
  });

  StoreModel.fromMap(Map<String, dynamic> m) {
    if (m["secoes"] != null) {
      m["secoes"].forEach((e) {
        aisle.add(AisleModel.fromMap(e));
      });
    }
    name = m["nome_loja"];
    slogan = m["slogan"];
  }

  @override
  String toString() => 'StoreModel(name: $name, aisle: $aisle, slogan: $slogan)';
}
