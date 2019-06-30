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
      color: new Color(0xFF282E3D),
      //  color: new Color(0xFF67739C),

      padding: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: new Text(
        city.name,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildItem(Item item) {
    var f = new NumberFormat("###.000", "en_US");

    final leftSection = new Flexible(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                item.type,
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ]),
        flex: 3);
    final rightSection = new Flexible(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Expanded(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      f.format(item.buy).toString(),
                      style: new TextStyle(color: Colors.white, fontSize: 14.0),
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
                      f.format(item.sell).toString(),
                      style: new TextStyle(color: Colors.white, fontSize: 14.0),
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
        flex: 3);

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
