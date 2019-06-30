import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final leftSection = new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Loại vàng",
              style: new TextStyle(
                  color: Colors.yellow,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            new Text(
              "(1000₫/lượng)",
              style: new TextStyle(
                  color: Colors.yellow,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        flex: 3);
    final rightSection = new Expanded(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Expanded(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      "Mua",
                      style: new TextStyle(
                          color: Colors.yellow,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
            new Expanded(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      "Bán",
                      textAlign: TextAlign.right,
                      style: new TextStyle(
                          color: Colors.yellow,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
          ],
        ),
        flex: 3);

    return new Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: new Color(0xFF282E3D),
              blurRadius: 2.0, // has the effect of softening the shadow
              offset: Offset(
                0.0, // horizontal, move right 10
                1.0, // vertical, move down 10
              ),
            )
          ],
          color: new Color(0xFF67739C),
        ),
        height: 55.0,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        alignment: Alignment.centerLeft,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[leftSection, rightSection]));
  }
}
