import 'package:flutter/material.dart';
import 'package:gold_price/model/gold_price/gold_price_response.dart';
import 'package:gold_price/screens/home/tabs/gold_price/header_section.dart';
import 'package:gold_price/screens/home/tabs/gold_price/list_section.dart';
import 'package:gold_price/screens/home/tabs/gold_price/title_section.dart';

class BuildGoldPriceWidget {
  Widget build(GoldPriceResponse _goldPrice) {
    Widget titleSection =
        TitleSection(title: "Cập nhật lúc: ${_goldPrice.rateList.updated}");
    Widget listSection = ListSection(goldPrice: _goldPrice);
    Widget headerSection = HeaderSection();
    return new Container(
        decoration: BoxDecoration(color: new Color(0xFF727B9B)),
        child: Column(children: [titleSection, headerSection, listSection]));
  }
}
