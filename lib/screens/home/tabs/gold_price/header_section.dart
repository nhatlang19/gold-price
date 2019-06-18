import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final leftSection = new Flexible(
        child: new Text(
          "Loại vàng",
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
                "Mua vào",
                style: new TextStyle(color: Colors.black, fontSize: 14.0),
              ),
              new Text(
                "Bán ra",
                style: new TextStyle(color: Colors.black, fontSize: 14.0),
              )
            ],
          ),
        ),
        flex: 1);

    return new Container(
        height: 60.0,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        alignment: Alignment.centerLeft,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[leftSection, rightSection]));
  }
}
