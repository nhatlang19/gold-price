import 'package:flutter/material.dart';

class NavLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[Text("Hello"), Text("World")],
      ),
    );
  }
}
