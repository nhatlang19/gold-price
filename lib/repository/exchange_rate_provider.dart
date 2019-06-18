import 'package:dio/dio.dart';
import 'package:xml2json/xml2json.dart';
import 'package:gold_price/model/echange_rate/exrate_list.dart';

class ExchangeRateProvider {
  final String _exchangeUrl = "https://www.vietcombank.com.vn/ExchangeRates/ExrateXML.aspx";
  final Dio _dio = Dio();
  final Xml2Json myTransformer = Xml2Json();

  Future<ExrateList> getExchangeRate() async {
    try {
      Response response = await _dio.get(_exchangeUrl);
      return ExrateList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ExrateList.withError("$error");
    }
  }
}