import 'package:flutter/material.dart';



class CustomContainer extends StatelessWidget {
  final String text;
  final String subtitle;
  final icon;
  CustomContainer({this.text, this.icon, this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 26,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
              ),
              Text(
                text == null
                    ? 'NONE'
                    : text.contains('Vehicules.')
                    ? text.substring(10)
                    : text,
                style: TextStyle(
                  fontSize: 18,
                ),
              ), // if no vehicule selected then print 'NONE'
              //substring to delete the string = 'Vehicules.'
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(9),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: const Offset(
                    1.0,
                    2.3,
                  ),
                  blurRadius: 1.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ]),
        ),
        subtitle == null
            ? null
            : Text(
          subtitle,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
