import 'package:flutter/material.dart';
import 'package:gold_price/model/echange_rate/exrate_list.dart';
import 'package:gold_price/screens/home/tabs/exchange_rate/header_section.dart';
import 'package:gold_price/screens/home/tabs/exchange_rate/list_section.dart';
import 'package:gold_price/screens/home/tabs/exchange_rate/title_section.dart';

class BuildExchangeRateWidget {
  Widget build(ExrateList exrateList) {
    Widget titleSection =
        TitleSection(title: "Cập nhật lúc: ${exrateList.dateTime}");
    Widget listSection = ListSection(exrateList: exrateList);
    Widget headerSection = HeaderSection();
    return new Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(children: [titleSection, headerSection, listSection]));
  }
}