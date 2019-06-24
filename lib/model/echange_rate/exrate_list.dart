import 'package:gold_price/model/echange_rate/exrate.dart';

class ExrateList {
  final String dateTime;
  final List<Exrate> lists;
  final String source;
  final String error;

  ExrateList(this.dateTime, this.lists, this.source, this.error);

  ExrateList.fromJson(Map<String, dynamic> json)
      : dateTime = json['DateTime']['\$t'],
        lists = (json["Exrate"] as List)
            .map((i) => new Exrate.fromJson(i))
            .toList(),
        source = json['Source']['\$t'],
        error = '';

  ExrateList.withError(String errorValue)
      : dateTime = '',
        lists = List(),
        source = '',
        error = errorValue;
}
