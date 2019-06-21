import 'package:flutter/material.dart';
import 'package:gold_price/model/gold_price/city.dart';
import 'package:gold_price/model/gold_price/gold_price_response.dart';
import 'package:gold_price/model/gold_price/item.dart';
import 'package:sticky_header_list/sticky_header_list.dart';
import 'package:intl/intl.dart';

class ListSection extends StatelessWidget {
  ListSection({Key key, @required this.goldPrice}) : super(key: key);

  final GoldPriceResponse goldPrice;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: StickyList(children: this._buildList().toList()));
  }

  List<StickyListRow> _buildList() {
    List<StickyListRow> lists = new List();

    if (this.goldPrice != null && this.goldPrice.rateList != null) {
      this.goldPrice.rateList.lists.forEach((city) => {
            lists.add(HeaderRow(child: this._buildHeader(city))),
            city.items.forEach(
                (item) => lists.add(RegularRow(child: this._buildItem(item))))
          });
    }
    return lists;
  }

  Widget _buildHeader(City city) {
    return new Container(
      height: 30.0,
      color: Colors.lightBlue,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: new Text(
        city.name,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildItem(Item item) {
    var f = new NumberFormat("###.000", "en_US");

    final leftSection = new Flexible(
        child: new Text(
          item.type,
          style: new TextStyle(color: Colors.black, fontSize: 14.0),
        ),
        flex: 2);
    final rightSection = new Flexible(
        child: new Container(
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                f.format(item.buy).toString(),
                style: new TextStyle(color: Colors.black, fontSize: 14.0),
              ),
              new Text(
                f.format(item.sell).toString(),
                style: new TextStyle(color: Colors.black, fontSize: 14.0),
              )
            ],
          ),
        ),
        flex: 1);

    return new Container(
        height: 50.0,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        alignment: Alignment.centerLeft,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[leftSection, rightSection]));
  }
}
