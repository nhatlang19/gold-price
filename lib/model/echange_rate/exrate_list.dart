import 'package:gold_price/model/echange_rate/exrate.dart';

class ExrateList {
  final String dateTime;
  final List<Exrate> results;
  final String source;
  final String error;

  ExrateList(this.dateTime, this.results, this.source, this.error);
  
  ExrateList.fromJson(Map<String, dynamic> json)
      : dateTime = json['DateTime'],
        results = (json["Exrate"] as List)
            .map((i) => new Exrate.fromJson(i))
            .toList(),
        source = json['Source'],
        error = '';

  ExrateList.withError(String errorValue)
      : dateTime = '', 
        results = List(),
        source = '',
        error = errorValue;
}
