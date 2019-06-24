import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final leftSection = new Flexible(
        child: new Text(
          "Mã NT",
          style: new TextStyle(
              color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        flex: 1);
    final rightSection = new Flexible(
        child: new Container(
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                "Mua",
                style: new TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              new Text(
                "CK",
                style: new TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              new Text(
                "Bán",
                style: new TextStyle(color: Colors.black, fontSize: 16.0),
              )
            ],
          ),
        ),
        flex: 1);

    return new Container(
        height: 40.0,
        color: Colors.grey,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        alignment: Alignment.centerLeft,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[leftSection, rightSection]));
  }
}
