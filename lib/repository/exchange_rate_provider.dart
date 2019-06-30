import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:xml2json/xml2json.dart';
import 'package:gold_price/model/echange_rate/exrate_list.dart';

class ExchangeRateProvider {
  final String _exchangeUrl = DotEnv().env['EXCHANGE_URL'];
  final Dio _dio = Dio();
  final Xml2Json xml2json = Xml2Json();

  Future<ExrateList> getExchangeRate() async {
    try {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
      Response response = await _dio.get(_exchangeUrl);
      xml2json.parse(response.data);
      var jsondata = xml2json.toGData();
      var exrateList = json.decode(jsondata);
      return ExrateList.fromJson(exrateList['ExrateList']);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ExrateList.withError("$error");
    }
  }
}
