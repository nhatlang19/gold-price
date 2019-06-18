import 'package:gold_price/repository/exchange_rate_provider.dart';
import 'package:gold_price/model/echange_rate/exrate_list.dart';

class ExchangeRateRepository {
  final ExchangeRateProvider _apiProvider = ExchangeRateProvider();

  Future<ExrateList> getExchangeRate() {
    return _apiProvider.getExchangeRate();
  }
}