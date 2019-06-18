import 'package:gold_price/model/gold_price/ratelist.dart';

class GoldPriceResponse {
  final String title;
  final String url;
  final RateList rateList;
  final String error;

  GoldPriceResponse(this.title, this.url, this.rateList, this.error);

  GoldPriceResponse.fromJson(Map<String, dynamic> json)
      : title = json['root']['title']['\$t'],
        url = json['root']['url']['\$t'],
        rateList = RateList.fromJson(json['root']['ratelist']),
        error = '';

  GoldPriceResponse.withError(String errorValue)
      : title = '',
        url = '',
        rateList = null,
        error = errorValue;
}
