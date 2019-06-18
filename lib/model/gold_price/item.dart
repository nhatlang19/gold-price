class Item {
  final double buy;
  final double sell;
  final String type;

  Item(this.buy, this.sell, this.type);

  Item.fromJson(Map<String, dynamic> json)
      : buy = double.parse(json["buy"]),
        sell = double.parse(json["sell"]),
        type = json["type"];
}
