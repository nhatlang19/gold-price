import 'package:flutter/material.dart';
import 'package:gold_price/model/echange_rate/exrate.dart';
import 'package:gold_price/model/echange_rate/exrate_list.dart';
import 'package:intl/intl.dart';

class ListSection extends StatelessWidget {
  ListSection({Key key, @required this.exrateList}) : super(key: key);

  final ExrateList exrateList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: this._buildList(),
      ),
    );
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
    var f = new NumberFormat("###", "en_US");

    final leftSection = new Flexible(
        child: new Text(
          item.currencyCode,
          style: new TextStyle(color: Colors.black, fontSize: 14.0),
        ),
        flex: 1);
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
                f.format(item.transfer).toString(),
                style: new TextStyle(color: Colors.black, fontSize: 14.0),
              ),
              new Text(
                f.format(item.sell).toString(),
                style: new TextStyle(color: Colors.black, fontSize: 14.0),
              )
            ],
          ),
        ),
        flex: 2);

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
