import 'package:flutter/material.dart';
import 'TextBox.dart';

class RatingNumber extends StatelessWidget {
  final int num;
  final String label;

  RatingNumber({this.num, this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextBox(
          label: label,
          color: Color(0xFF9302F1),
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17.0,
            color: Colors.white,
          ),
        ),
        Text(
          "$num",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }
}
