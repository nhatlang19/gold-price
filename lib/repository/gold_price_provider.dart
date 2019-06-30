import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gold_price/model/gold_price/gold_price_response.dart';
import 'package:xml2json/xml2json.dart';

class GoldPriceProvider {
  final String _url = DotEnv().env['GOLD_RATING_URL'];
  final Dio _dio = Dio();
  final Xml2Json xml2json = Xml2Json();

  Future<GoldPriceResponse> getGoldPrice() async {
    try {
      Response response = await _dio.get(_url);
      xml2json.parse(response.data);
      var jsondata = xml2json.toGData();
      return GoldPriceResponse.fromJson(json.decode(jsondata));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return GoldPriceResponse.withError("$error");
    }
  }
}
