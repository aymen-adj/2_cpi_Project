import 'package:flutter/material.dart';

/**
 * created by Mosbah :
 *
 * this is a custom container used acress the app
 *  use it ;
 */

class BasicContainerWithShadow extends StatelessWidget {
  final Widget child;
  BasicContainerWithShadow({
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 26,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: child,
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
            offset: const Offset(
              0.0,
              0.0,
            ),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
    );
  }
}
