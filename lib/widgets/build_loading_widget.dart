import 'package:flutter/material.dart';

class BuildLoadingWidget {
  Widget build() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Loading data ..."), CircularProgressIndicator()],
    ));
  }
}
