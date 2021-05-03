import 'package:flutter/material.dart';
import 'package:appbar_design/components/TextBox.dart';

class RatingStars extends StatelessWidget {
  final int rate;
  final String label;

  RatingStars({this.rate, this.label});

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
        Row(
          children: [
            for (int i = 0; i < 5; i++)
              Icon(
                Icons.star,
                color: (i < rate) ? Color(0xFFFFD700) : Color(0xFFCED5DB),
              ),
          ],
        ),
      ],
    );
  }
}
