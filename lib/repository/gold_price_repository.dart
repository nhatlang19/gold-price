import 'package:gold_price/model/gold_price/gold_price_response.dart';
import 'package:gold_price/repository/gold_price_provider.dart';

class GoldPriceRepository {
  final GoldPriceProvider _apiProvider = GoldPriceProvider();

  Future<GoldPriceResponse> getGoldPrice() {
    return _apiProvider.getGoldPrice();
  }
}