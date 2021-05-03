import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String label;
  final Color color;
  final TextStyle textStyle;
  TextBox({this.label, this.textStyle, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(bottom: 5.0),
      padding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 2.0,
      ),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(17.0)),
      child: Text(
        label,
        style: textStyle,
      ),
    );
  }
}
