import 'package:gold_price/model/echange_rate/exrate_list.dart';
import 'package:gold_price/repository/exchange_rate_repository.dart';
import 'package:rxdart/rxdart.dart';

class ExchangeRateBloc {
  final ExchangeRateRepository _exchangeRateRepository =
      ExchangeRateRepository();

  final BehaviorSubject<ExrateList> _subject = BehaviorSubject<ExrateList>();

  getExchangeRate() async {
    ExrateList response = await _exchangeRateRepository.getExchangeRate();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ExrateList> get subject => _subject;
}
