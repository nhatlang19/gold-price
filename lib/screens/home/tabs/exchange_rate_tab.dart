import 'package:flutter/material.dart';

class ExchangeRateTab extends StatelessWidget {
  const ExchangeRateTab({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text("Tỷ giá"),
      ],
    );
  }
}