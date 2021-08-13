import 'package:store/src/core/item_model.dart';

class AisleModel {
  String image;
  String name;
  List<ItemModel> items = [];
  AisleModel({
    this.image,
    this.name,
    this.items,
  });

  AisleModel.fromMap(Map<String, dynamic> m) {

    if(m["itens"] != null){
      m["itens"].forEach((e){
        items.add(ItemModel.fromMap(e));
      });
    }
      image = m["imagem"];
      name = m["nome_secao"];
  }

  @override
  String toString() => 'AisleModel(image: $image, name: $name, items: $items)';
}
