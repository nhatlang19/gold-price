import 'package:gold_price/model/gold_price/city.dart';

class RateList {
  final String updated;
  final String unit;
  final List<City> lists;

  RateList(this.updated, this.unit, this.lists);

  RateList.fromJson(Map<String, dynamic> json)
      : updated = json["updated"],
        unit = json["unit"],
        lists = (json["city"] as List)
            .map((i) => new City.fromJson(i))
            .toList();
}