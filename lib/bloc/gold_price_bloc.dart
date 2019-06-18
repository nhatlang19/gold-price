import 'package:gold_price/model/gold_price/gold_price_response.dart';
import 'package:gold_price/repository/gold_price_repository.dart';
import 'package:rxdart/rxdart.dart';

class GoldPriceBloc {
  final GoldPriceRepository _goldPriceRepository = GoldPriceRepository();

  final BehaviorSubject<GoldPriceResponse> _subject =
      BehaviorSubject<GoldPriceResponse>();

  getGoldPrice() async {
    GoldPriceResponse response = await _goldPriceRepository.getGoldPrice();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<GoldPriceResponse> get subject => _subject;
}
