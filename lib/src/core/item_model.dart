import 'dart:convert';

class ItemModel {
  String image;
  String name;
  num price;
  ItemModel({
    this.image,
    this.name,
    this.price,
  });

  // factory ItemModel.fromMap(Map<String, dynamic> m) {
  //   return ItemModel(
  //     image: m["imagem"],
  //     name: m["nome"],
  //     price: m["preco"],
  //   );
  // }

  @override
  String toString() => 'ItemModel(image: $image, name: $name, price: $price)';


  factory ItemModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ItemModel(
      image: map['image'],
      name: map['name'],
      price: map['price'],
    );
  }
}
