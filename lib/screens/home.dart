import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:gold_price/screens/drawer/nav_left.dart';
import 'package:gold_price/screens/home/tabs/exchange_rate_tab.dart';
import 'package:gold_price/screens/home/tabs/gold_price_tab.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Giá vàng"),
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
              iconData: Icons.home,
              title: "Giá vàng",
            ),
            TabData(
              iconData: Icons.search,
              title: "Tỷ giá",
            ),
          ],
          initialSelection: 0,
          key: bottomNavigationKey,
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
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
        return new ExchangeRateTab(context: context);
      default:
        return new GoldPriceTab();
    }
  }
}
