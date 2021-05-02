import 'package:flutter/material.dart';

import 'BasicContainerWithShadow.dart';

/**
 * created by Mosbah :
 *
 * this is a custom container used acress the app
 *  use it ;
 */

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
        BasicContainerWithShadow(
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
