import 'package:flutter/material.dart';
import 'package:gold_price/bloc/exchange_rate_bloc.dart';
import 'package:gold_price/model/echange_rate/exrate_list.dart';
import 'package:gold_price/widgets/gold_price_widget.dart';

class ExchangeRateTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ExchangeRateState();
  }
}

class _ExchangeRateState extends State<ExchangeRateTab> {
  final bloc = ExchangeRateBloc();

  @override
  void initState() {
    super.initState();
    bloc.getExchangeRate();
  }

  @override
  Widget build(BuildContext context) {
    GoldPriceWidget _widget = GoldPriceWidget();

    return StreamBuilder<ExrateList>(
      stream: bloc.subject.stream,
      builder: (context, AsyncSnapshot<ExrateList> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _widget.buildError(snapshot.data.error);
          }
          return _widget.buildExchangeRate(snapshot.data, bloc);
        } else if (snapshot.hasError) {
          return _widget.buildError(snapshot.error);
        } else {
          return _widget.buildLoading();
        }
      },
    );
  }
}
