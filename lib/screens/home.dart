import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:gold_price/screens/drawer/nav_left.dart';
import 'package:gold_price/screens/home/tabs/exchange_rate_tab.dart';
import 'package:gold_price/screens/home/tabs/gold_price_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  String title = "Giá vàng";
  String subTitle = "( Nguồn SJC )";

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                Text(
                  subTitle,
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ]),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: _getPage(currentPage),
          ),
        ),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(
              iconData: FontAwesomeIcons.handHoldingUsd,
              title: "Giá vàng",
            ),
            TabData(
              iconData: FontAwesomeIcons.exchangeAlt,
              title: "Tỷ giá",
            ),
          ],
          initialSelection: 0,
          key: bottomNavigationKey,
          barBackgroundColor: new Color(0xFF727B9B),
          textColor: Colors.white,
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
              title = position == 0 ? "Giá vàng" : "Tỷ giá";
              subTitle = position == 0 ? "( Nguồn SJC )" : "( Nguồn VCB )";
            });
          },
        ),
        drawer: NavLeft());
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return new GoldPriceTab();
      case 1:
        return new ExchangeRateTab();
      default:
        return new GoldPriceTab();
    }
  }
}
