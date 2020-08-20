
import 'package:flutter/material.dart';

class SeparatorWidget extends StatelessWidget {
  const SeparatorWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
          child: Container(
            height: 2,
            color: Colors.grey,
          )),
      Center(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text("Cuaca 5 Hari Kedepan"))),
      Expanded(
          child: Container(
            height: 2,
            color: Colors.grey,
          ))
    ]);
  }
}
