import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gold_price/bloc/exchange_rate_bloc.dart';
import 'package:gold_price/model/echange_rate/exrate.dart';
import 'package:gold_price/model/echange_rate/exrate_list.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class ListSection extends StatelessWidget {
  ListSection({Key key, @required this.exrateList, @required this.bloc})
      : super(key: key);

  final ExrateList exrateList;
  final ExchangeRateBloc bloc;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: this._buildList(),
      ),
    );
  }

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    bloc.getExchangeRate();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });

    return completer.future.then<void>((_) {
      _refreshIndicatorKey.currentState.show();
    });
  }

  List<Widget> _buildList() {
    List<Widget> lists = new List();

    if (this.exrateList != null && this.exrateList.lists != null) {
      this
          .exrateList
          .lists
          .forEach((exrate) => {lists.add(this._buildItem(exrate))});
    }
    return lists;
  }

  Widget _buildItem(Exrate item) {
    var f = new NumberFormat("##,###", "en_US");

    final leftSection = new Flexible(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(right: 8.0),
                  child: new Image.asset(
                      'assets/flag_${item.currencyCode.toLowerCase()}.png',
                      width: 40.0,
                      height: 40.0),
                ),
                new Text(
                  item.currencyCode,
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        flex: 2);
    final rightSection = new Flexible(
        child: new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Expanded(
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        item.buy,
                        style:
                            new TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                      new Text(
                        '-',
                        style: new TextStyle(
                            color: Colors.greenAccent, fontSize: 14.0),
                      ),
                    ]),
              ),
              new Expanded(
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        item.transfer,
                        style:
                            new TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                      new Text(
                        '-',
                        style: new TextStyle(
                            color: Colors.greenAccent, fontSize: 14.0),
                      ),
                    ]),
              ),
              new Expanded(
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        item.sell,
                        style:
                            new TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                      new Text(
                        '-',
                        style: new TextStyle(
                            color: Colors.greenAccent, fontSize: 14.0),
                      ),
                    ]),
              ),
            ],
          ),
        ),
        flex: 4);

    return new Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5, color: new Color(0xFF282E3D)),
          ),
          color: new Color(0xFF727B9B),
        ),
        height: 60.0,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        alignment: Alignment.centerLeft,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[leftSection, rightSection]));
  }
}
