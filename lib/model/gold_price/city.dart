import 'package:gold_price/model/gold_price/item.dart';

class City {
  final String name;
  final List<Item> items;

  City(this.name, this.items);

  City.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        items = (json["item"] is List)
            ? (json["item"] as List).map((i) => new Item.fromJson(i)).toList()
            : [Item.fromJson(json["item"])];
}
