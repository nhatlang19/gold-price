import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gold_price/bloc/gold_price_bloc.dart';
import 'package:gold_price/model/gold_price/gold_price_response.dart';

import 'gold_price/header_section.dart';
import 'gold_price/list_section.dart';
import 'gold_price/title_section.dart';

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
    return StreamBuilder<GoldPriceResponse>(
      stream: bloc.subject.stream,
      builder: (context, AsyncSnapshot<GoldPriceResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildGoldPriceWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Loading data ..."), CircularProgressIndicator()],
    ));
  }

  Widget _buildGoldPriceWidget(GoldPriceResponse _goldPrice) {
    Widget titleSection =
        TitleSection(title: "Cập nhật lúc: ${_goldPrice.rateList.updated}");
    Widget listSection = ListSection(goldPrice: _goldPrice);
    Widget headerSection = HeaderSection();
    return new Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(children: [titleSection, headerSection, listSection]));
  }
}
