import 'package:flutter/material.dart';
import 'package:gold_price/model/echange_rate/exrate_list.dart';
import 'package:gold_price/model/gold_price/gold_price_response.dart';

import 'build_error_widget.dart';
import 'build_exchange_rate_widget.dart';
import 'build_gold_price_widget.dart';
import 'build_loading_widget.dart';

class GoldPriceWidget {
  final errorWidget = BuildErrorWidget();
  final loadingWidget = BuildLoadingWidget();
  final goldWidget = BuildGoldPriceWidget();
  final exchangeWidget = BuildExchangeRateWidget();

  Widget buildError(String error) {
    return this.errorWidget.build(error);
  }

  Widget buildLoading() {
    return this.loadingWidget.build();
  }

  Widget buildGoldPrice(GoldPriceResponse _goldPrice) {
    return this.goldWidget.build(_goldPrice);
  }

  Widget buildExchangeRate(ExrateList exrateList) {
    return this.exchangeWidget.build(exrateList);
  }
}
