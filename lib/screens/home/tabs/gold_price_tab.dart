import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gold_price/bloc/gold_price_bloc.dart';
import 'package:gold_price/model/gold_price/gold_price_response.dart';
import 'package:gold_price/widgets/gold_price_widget.dart';

class GoldPriceTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _GoldPriceState();
  }
}

class _GoldPriceState extends State<GoldPriceTab> {
  final bloc = GoldPriceBloc();

  @override
  void initState() {
    super.initState();
    bloc.getGoldPrice();

    new Timer.periodic(Duration(minutes: 1), (Timer t) => bloc.getGoldPrice());
  }

  @override
  Widget build(BuildContext context) {
    GoldPriceWidget _widget = GoldPriceWidget();

    return StreamBuilder<GoldPriceResponse>(
      stream: bloc.subject.stream,
      builder: (context, AsyncSnapshot<GoldPriceResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _widget.buildError(snapshot.data.error);
          }
          return _widget.buildGoldPrice(snapshot.data);
        } else if (snapshot.hasError) {
          return _widget.buildError(snapshot.error);
        } else {
          return _widget.buildLoading();
        }
      },
    );
  }
}
